import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ytnkio/services/base/service_response.dart';

class ServiceBase {
  // final String apiUrl = "https://ytnkio-dca8dfbrh9hxgyet.germanywestcentral-01.azurewebsites.net/api/v1";

  // Local development - use localhost for iOS Simulator, 10.0.2.2 for Android Emulator
  static String _getApiUrl() {
    const useProd = bool.fromEnvironment('USE_PROD', defaultValue: false);
    if (kReleaseMode || useProd) {
      return "https://ytnkio-dca8dfbrh9hxgyet.germanywestcentral-01.azurewebsites.net/api/v1";
    }
    if (Platform.isIOS) {
      return "http://localhost:5240/api/v1"; // iOS Simulator
    } else if (Platform.isAndroid) {
      return "http://10.0.2.2:5240/api/v1"; // Android Emulator
    }
    return "http://localhost:5240/api/v1"; // Default fallback
  }

  final String apiUrl = _getApiUrl();

  final String livenessCheckUrl = "/iamhere";

  Map<String, String> _buildHeaders(
    String idToken, {
    required bool includeAuthorization,
    bool includeJsonContentType = true,
  }) {
    final headers = <String, String>{};

    if (includeJsonContentType) {
      headers["Content-Type"] = "application/json";
    }

    if (includeAuthorization && idToken.isNotEmpty) {
      headers["Authorization"] = "Bearer $idToken";
    }

    return headers;
  }

  Future<String> _resolveAuthToken({
    String preferredToken = "",
    bool forceRefresh = false,
  }) async {
    if (preferredToken.isNotEmpty && !forceRefresh) {
      await setIdToken(preferredToken);
      return preferredToken;
    }

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final firebaseToken = await currentUser.getIdToken(forceRefresh);
        if (firebaseToken != null && firebaseToken.isNotEmpty) {
          await setIdToken(firebaseToken);
          return firebaseToken;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('🔴 Failed to resolve Firebase token: $e');
      }
    }

    if (forceRefresh) {
      return "";
    }

    if (preferredToken.isNotEmpty) {
      await setIdToken(preferredToken);
      return preferredToken;
    }

    return getStoredIdToken();
  }

  Future<http.Response> _executeRequest({
    required String method,
    required String url,
    required Future<http.Response> Function(Map<String, String> headers) send,
    required bool includeAuthorization,
    String idToken = "",
    String? bodyLog,
    bool includeJsonContentType = true,
    bool logResponseBody = true,
  }) async {
    var resolvedToken = "";
    if (includeAuthorization) {
      resolvedToken = await _resolveAuthToken(preferredToken: idToken);
    }

    Future<http.Response> performRequest(
      String token, {
      required bool isRetry,
    }) async {
      final headers = _buildHeaders(
        token,
        includeAuthorization: includeAuthorization,
        includeJsonContentType: includeJsonContentType,
      );

      if (kDebugMode) {
        final retrySuffix = isRetry ? " (retry with fresh token)" : "";
        debugPrint('🔵 API $method Request$retrySuffix: $url');
        debugPrint('🔵 Headers: $headers');
        if (bodyLog != null) {
          debugPrint('🔵 Body: $bodyLog');
        }
      }

      final response = await send(headers).onError((error, stackTrace) {
        if (kDebugMode) {
          debugPrint('🔴 API Error: $error');
        }
        return http.Response('Network problem.', 500);
      }).timeout(const Duration(seconds: 20), onTimeout: () {
        if (kDebugMode) {
          debugPrint('🔴 API Timeout: $url');
        }
        return http.Response('Timeout.', 500);
      });

      if (kDebugMode) {
        debugPrint('🟢 API Response: ${response.statusCode} - $url');
        if (logResponseBody) {
          final responseBody = response.body;
          debugPrint(
              '🟢 Body: ${responseBody.length > 500 ? "${responseBody.substring(0, 500)}..." : responseBody}');
        }
      }

      return response;
    }

    var response = await performRequest(resolvedToken, isRetry: false);
    if (response.statusCode != 401 || !includeAuthorization) {
      return response;
    }

    final freshToken = await _resolveAuthToken(forceRefresh: true);
    if (freshToken.isEmpty || freshToken == resolvedToken) {
      return response;
    }

    return performRequest(freshToken, isRetry: true);
  }

  Future<ServiceResponse<String>> postAPIRequest(
      String service, Map<String, dynamic> parameters,
      {String idToken = "", bool includeAuthorization = true}) async {
    final url = "$apiUrl/$service";
    final requestBody = json.encode(parameters);

    try {
      final response = await _executeRequest(
        method: "POST",
        url: url,
        includeAuthorization: includeAuthorization,
        idToken: idToken,
        bodyLog: requestBody,
        send: (headers) =>
            http.post(Uri.parse(url), headers: headers, body: requestBody),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isEmpty) {
          return ServiceResponse.success();
        } else {
          return ServiceResponse.success(responseObject: response.body);
        }
      } else if (response.statusCode == 401) {
        return ServiceResponse.fail("Unauthorized", isUnauthorized: true);
      } else {
        return ServiceResponse.fail("Server error. ${response.body}");
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('🔴 API Exception: $e');
      }
      return ServiceResponse.fail(e.toString());
    }
  }

  Future<ServiceResponse<String>> postAPIRequestWithFormFile(String service,
      Map<String, String> parameters, String fileParameterName, File file,
      {String idToken = ""}) async {
    try {
      final url = "$apiUrl/$service";
      final response = await _executeRequest(
        method: "POST Multipart",
        url: url,
        includeAuthorization: true,
        idToken: idToken,
        bodyLog: 'Fields: $parameters, File: ${file.path.split("/").last}',
        includeJsonContentType: false,
        send: (headers) async {
          final request = http.MultipartRequest("POST", Uri.parse(url));
          request.files.add(await http.MultipartFile.fromPath(
              fileParameterName, file.path,
              filename: file.path.split("/").last));
          request.headers.addAll(headers);
          request.fields.addAll(parameters);
          return http.Response.fromStream(await request.send());
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ServiceResponse.success();
      } else if (response.statusCode == 401) {
        return ServiceResponse.fail("Unauthorized", isUnauthorized: true);
      } else {
        return ServiceResponse.fail("Server error.");
      }
    } catch (e) {
      return ServiceResponse.fail(e.toString());
    }
  }

  Future<ServiceResponse<Uint8List>> postAPIRequestForImage(
      String service, Map<String, dynamic> parameters,
      {String idToken = ""}) async {
    try {
      final url = "$apiUrl/$service";
      final requestBody = json.encode(parameters);
      final response = await _executeRequest(
        method: "POST",
        url: url,
        includeAuthorization: true,
        idToken: idToken,
        bodyLog: requestBody,
        logResponseBody: false,
        send: (headers) =>
            http.post(Uri.parse(url), headers: headers, body: requestBody),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isEmpty) {
          return ServiceResponse.fail("Empty Image");
        } else {
          return ServiceResponse.success(responseObject: response.bodyBytes);
        }
      } else if (response.statusCode == 401) {
        return ServiceResponse.fail("Unauthorized", isUnauthorized: true);
      } else {
        return ServiceResponse.fail("Server error. ${response.body}");
      }
    } catch (e) {
      return ServiceResponse.fail(e.toString());
    }
  }

  Future<ServiceResponse<String>> getAPIRequest(String service,
      {String idToken = ""}) async {
    final url = "$apiUrl/$service";

    try {
      final response = await _executeRequest(
        method: "GET",
        url: url,
        includeAuthorization: true,
        idToken: idToken,
        send: (headers) => http.get(Uri.parse(url), headers: headers),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isEmpty) {
          return ServiceResponse.success();
        } else {
          return ServiceResponse.success(responseObject: response.body);
        }
      } else if (response.statusCode == 401) {
        return ServiceResponse.fail("Unauthorized", isUnauthorized: true);
      } else {
        return ServiceResponse.fail("Server error. ${response.body}");
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('🔴 API Exception: $e');
      }
      return ServiceResponse.fail(e.toString());
    }
  }

  Future<bool> setIdToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("idToken", value);
  }

  Future<bool> clearIdToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("idToken");
  }

  Future<String> getStoredIdToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("idToken") ?? "";
  }

  Future<String> getIdToken({bool forceRefresh = false}) async {
    return _resolveAuthToken(forceRefresh: forceRefresh);
  }

  /// Forces a fresh token from Firebase and stores it
  Future<String> getFreshIdToken() async {
    return getIdToken(forceRefresh: true);
  }
}

class ServiceBaseHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
