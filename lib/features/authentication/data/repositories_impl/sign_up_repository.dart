import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/constant/api_link.dart';
import '../../../../core/services/network/api_client.dart';
import '../../../../core/services/network/request_status.dart';
import '../model/user_model.dart';

class SignUpRepository {
  final ApiClient apiClient = ApiClient();
  Future<Either<RequestStatus, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final data = {"name": name, "email": email, "password": password};
    final response = await apiClient.postData(ApiLink.signup, data);

    return response.fold((failure) => Left(failure), (body) {
      if (body["status"] == "success" && body["data"] != null) {
        final user = UserModel.fromJson(body["data"]);
        return Right(user);
      }
      return const Left(RequestStatus.serverFailure);
    });
  }
}
