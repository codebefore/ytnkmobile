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
    if (Platform.isIOS) {
      return "http://localhost:5240/api/v1";  // iOS Simulator
    } else if (Platform.isAndroid) {
      return "http://10.0.2.2:5240/api/v1";  // Android Emulator
    }
    return "http://localhost:5240/api/v1";  // Default fallback
  }

  final String apiUrl = _getApiUrl();

  final String livenessCheckUrl = "/iamhere";

  Future<ServiceResponse<String>> postAPIRequest(
      String service, Map<String, dynamic> parameters,
      {String idToken = ""}) async {
    final url = "$apiUrl/$service";

    try {
      if (idToken.isNotEmpty) {
        setIdToken(idToken);
      } else {
        idToken = await getIdToken();
      }

      // Log request
      if (kDebugMode) {
        debugPrint('🔵 API POST Request: $url');
        debugPrint('🔵 Headers: {"Content-Type": "application/json", "Authorization": "Bearer $idToken"}');
        debugPrint('🔵 Body: ${json.encode(parameters)}');
      }

      final response = await http
          .post(Uri.parse(url),
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $idToken"
              },
              body: json.encode(parameters))
          .onError((error, stackTrace) {
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

      // Log response
      if (kDebugMode) {
        debugPrint('🟢 API Response: ${response.statusCode} - $url');
        debugPrint('🟢 Body: ${response.body.length > 500 ? "${response.body.substring(0, 500)}..." : response.body}');
      }

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
      if (idToken.isNotEmpty) {
        setIdToken(idToken);
      } else {
        idToken = await getIdToken();
      }

      var request =
          http.MultipartRequest("POST", Uri.parse("$apiUrl/$service"));

      request.files.add(await http.MultipartFile.fromPath(
          fileParameterName, file.path,
          filename: file.path.split("/").last));

      request.headers.addAll({
        "Content-Type": "application/json",
        "Authorization": "Bearer $idToken"
      });

      request.fields.addAll(parameters);

      var response = await request.send();

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
      if (idToken.isNotEmpty) {
        setIdToken(idToken);
      } else {
        idToken = await getIdToken();
      }

      final response = await http
          .post(Uri.parse("$apiUrl/$service"),
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $idToken"
              },
              body: json.encode(parameters))
          .onError((error, stackTrace) {
        return http.Response('Network problem.', 500);
      }).timeout(const Duration(seconds: 20), onTimeout: () {
        return http.Response('Timeout.', 500);
      });

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

  Future<ServiceResponse<String>> getAPIRequest(
      String service,
      {String idToken = ""}) async {
    final url = "$apiUrl/$service";

    try {
      if (idToken.isNotEmpty) {
        setIdToken(idToken);
      } else {
        idToken = await getIdToken();
      }

      // Log request
      if (kDebugMode) {
        debugPrint('🔵 API GET Request: $url');
        debugPrint('🔵 Headers: {"Content-Type": "application/json", "Authorization": "Bearer $idToken"}');
      }

      final response = await http
          .get(Uri.parse(url),
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $idToken"
              })
          .onError((error, stackTrace) {
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

      // Log response
      if (kDebugMode) {
        debugPrint('🟢 API Response: ${response.statusCode} - $url');
        debugPrint('🟢 Body: ${response.body.length > 500 ? "${response.body.substring(0, 500)}..." : response.body}');
      }

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

  Future<String> getIdToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("idToken") ?? "";
  }

  /// Forces a fresh token from Firebase and stores it
  Future<String> getFreshIdToken() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final freshToken = await user.getIdToken(true); // forceRefresh=true
        if (freshToken != null) {
          await setIdToken(freshToken);
          return freshToken;
        }
      }
    } catch (e) {
      debugPrint('🔴 Failed to refresh Firebase token: $e');
    }
    // Fallback to stored token
    return await getIdToken();
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
