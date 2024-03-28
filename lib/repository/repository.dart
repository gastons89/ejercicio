import 'package:ejercicio/model/delivery_info.dart';
import 'package:ejercicio/provider/api/api_provider.dart';
import 'package:ejercicio/provider/api/iapi_provider.dart';
import 'package:ejercicio/repository/irepository.dart';

class Repository implements IRepository {
  late IApiProvider api;

  Repository() {
    api = ApiProvider();
  }

  @override
  Future<DeliveryInfo> getDeliveryInfo(String qrInfo) async {
    return api.getDeliveryInfo(qrInfo);
  }
}
