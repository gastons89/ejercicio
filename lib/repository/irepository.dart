import 'package:ejercicio/model/delivery_info.dart';

abstract class IRepository {
  Future<DeliveryInfo> getDeliveryInfo(String qrInfo);
}
