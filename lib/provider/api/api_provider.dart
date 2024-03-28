import 'dart:convert';

import 'package:ejercicio/model/delivery_info.dart';
import 'package:ejercicio/provider/api/iapi_provider.dart';
import 'package:flutter/services.dart';

class ApiProvider extends IApiProvider {
  @override
  Future<DeliveryInfo> getDeliveryInfo(String qrInfo) async {
    await Future.delayed(const Duration(seconds: 3));
    final mockResponseJson =
        await rootBundle.loadString("mock/example_delivery.json");
    DeliveryInfo response =
        DeliveryInfo.fromJson(json.decode(mockResponseJson));
    return response;
  }
}
