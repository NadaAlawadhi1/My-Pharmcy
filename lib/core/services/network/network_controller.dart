import 'package:e_commerce/core/services/network/network_service.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  RxBool isOnline = true.obs;

  @override
  void onInit() {
    super.onInit();

    NetworkService.connectionStream.listen((status) {
      isOnline.value = status;
    });
  }
}
