import 'dart:async';
//import 'package:http/http.dart' as http;

class ConnectivityService {
  final String serviceUrl;
  final Duration checkInterval;
  final Duration timeoutInterval;
  Timer? checkTimer;

  bool isAlive = true;

  StreamController<bool> serviceLivenessStreamController =
      StreamController<bool>.broadcast();

  ConnectivityService(
      {required this.serviceUrl,
      this.checkInterval = const Duration(seconds: 6000),
      this.timeoutInterval = const Duration(seconds: 2)}) {
    check();
    setupNewTimer();
  }

  void setupNewTimer() {
    checkTimer = Timer.periodic(checkInterval, tick);
  }

  void tick(Timer timer) async {
    check();
  }

  void check() async {
    isAlive = await accessLivenessService();

    if (serviceLivenessStreamController.isClosed) {
      pause();

      return;
    }

    serviceLivenessStreamController.add(isAlive);
  }

  Future<bool> accessLivenessService() async {
    //todo: will be opened on production expensive on cloud
    return true;

    // try {
    //   final response =
    //       await http.get(Uri.parse(serviceUrl)).timeout(timeoutInterval);
    //   return response.statusCode == 200;
    // } catch (e) {
    //   return false;
    // }
  }

  void pause() {
    if (checkTimer != null && checkTimer!.isActive) {
      checkTimer?.cancel();
    }
  }

  void resume() {
    if (checkTimer != null) {
      if (!checkTimer!.isActive) {
        check();
        setupNewTimer();
      }
    }
  }

  void dispose() {
    serviceLivenessStreamController.close();
  }
}
