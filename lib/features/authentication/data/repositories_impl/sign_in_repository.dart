import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/services/network/api_client.dart';
import 'package:e_commerce/core/services/network/request_status.dart';
import 'package:e_commerce/core/constant/api_link.dart';
import 'package:e_commerce/features/authentication/data/model/user_model.dart';

class SignInRepository {
  final ApiClient apiClient = ApiClient();

  Future<Either<RequestStatus, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    final response = await apiClient.postData(ApiLink.signIn, {
      "email": email,
      "password": password,
    });

    return response.fold((failure) => Left(failure), (data) {
      if (data["status"] == "success") {
        final user = UserModel.fromJson(data["user"]);
        return Right(user);
      } else if (data["status"] == "unverified") {
        return const Left(RequestStatus.unverified);
      } else if (data["status"] == "failure") {
        return const Left(RequestStatus.failure);
      } else {
        return const Left(RequestStatus.serverFailure);
      }
    });
  }
}
