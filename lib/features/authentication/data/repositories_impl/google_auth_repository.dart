import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce/core/constant/api_link.dart' as ApiLink;
import 'package:e_commerce/core/services/network/request_status.dart';
import 'package:e_commerce/features/authentication/data/model/user_model.dart';

class GoogleAuthRepository {
  Future<Either<RequestStatus, UserModel>> loginWithGoogle({
    required String email,
    required String name,
    required String googleId,
    required String photo,
  }) async {
    try {
      final resp = await http.post(
        Uri.parse(ApiLink.ApiLink.googleLogin),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "name": name,
          "google_id": googleId,
          "photo": photo,
        }),
      );

      if (resp.statusCode != 200) {
        return const Left(RequestStatus.serverFailure);
      }

      final json = jsonDecode(resp.body);
      if (json["status"] == "success" && json["data"] != null) {
        final user = UserModel.fromJson(json["data"]);
        return Right(user);
      } else {
        return const Left(RequestStatus.failure);
      }
    } catch (_) {
      return const Left(RequestStatus.serverFailure);
    }
  }
}
