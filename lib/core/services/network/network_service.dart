import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  static Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    return await InternetConnectionChecker.instance.hasConnection;
  }

  static Stream<bool> get connectionStream => InternetConnectionChecker
      .instance
      .onStatusChange
      .map((status) => status == InternetConnectionStatus.connected);
}
