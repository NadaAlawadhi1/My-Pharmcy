import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/services/network/api_client.dart';
import 'package:e_commerce/core/services/network/request_status.dart';
import 'package:e_commerce/core/constant/api_link.dart';
import 'package:e_commerce/features/authentication/data/model/user_model.dart';

class VerifyCodeRepository {
  final ApiClient apiClient = ApiClient();

  Future<Either<RequestStatus, Object>> verifyCode({
    required String email,
    required String code,
    required String purpose, 
  }) async {
    final data = {
      "email": email,
      "verifycode": code,
      "action": "verify",
      "purpose": purpose,
    };

    final result = await apiClient.postData(ApiLink.verifyCode, data);

    return result.fold(
      (failure) => Left(failure),
      (body) {
        if (body["status"] != "success") {
          return const Left(RequestStatus.failure);
        }

        if (purpose == "signup") {
          if (body["user"] == null) {
            return const Left(RequestStatus.serverFailure);
          }
          return Right(UserModel.fromJson(body["user"]));
        }

        return const Right(true);
      },
    );
  }

  Future<Either<RequestStatus, bool>> resendCode({
    required String email,
    required String purpose,
  }) async {
    final data = {"email": email, "action": "resend", "purpose": purpose};

    final result = await apiClient.postData(ApiLink.verifyCode, data);

    return result.fold(
      (failure) => Left(failure),
      (body) => (body["status"] == "success")
          ? const Right(true)
          : const Left(RequestStatus.failure),
    );
  }
}
