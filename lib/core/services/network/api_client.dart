import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'network_service.dart';
import 'request_status.dart';

class ApiClient {
  /// POST request
  Future<Either<RequestStatus, Map>> postData(
    String url,
    Map<String, dynamic> data,
  ) async {
    try {
      // 1️⃣ Check internet connection first
      final hasInternet = await NetworkService.hasInternetConnection();
      if (!hasInternet) return const Left(RequestStatus.offlineFailure);

      // 2️⃣ Send POST request
      final response = await http.post(Uri.parse(url), body: data);
      print("🔍 [${response.statusCode}] ${response.body}");

      // 3️⃣ Check HTTP status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> body = jsonDecode(response.body);

        // 4️⃣ Check backend response (PHP validation)
        // Assuming your PHP API returns something like: {"status": "success", ...}
        if (body["status"] == "success") {
          return Right(body);
        } else if (body["status"] == "unverified") {
          return const Left(RequestStatus.unverified);
        } else if (body["status"] == "resend_verification") {
          return const Left(RequestStatus.unverified);
        } else if (body["status"] == "failure") {
          return const Left(RequestStatus.failure);
        } else {
          return const Left(RequestStatus.serverFailure);
        }
      } else {
        return const Left(RequestStatus.serverFailure); // Server error
      }
    } catch (_) {
      // Any unexpected exception
      return const Left(RequestStatus.serverFailure);
    }
  }
}
