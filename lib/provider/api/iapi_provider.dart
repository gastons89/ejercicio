import 'package:ejercicio/model/delivery_info.dart';

abstract class IApiProvider {
    Future<DeliveryInfo> getDeliveryInfo(String qrInfo);
}