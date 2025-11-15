import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/services/network/request_status.dart';

RequestStatus handlingStatusData(response) {
  if (response is Left) {
    return response.value;
  } else {
    return RequestStatus.success;
  }
}
