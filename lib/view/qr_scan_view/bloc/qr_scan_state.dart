import 'package:ejercicio/model/delivery_info.dart';

abstract class QRScanState {
  final DeliveryInfo? deliveryInfo;

  const QRScanState({required this.deliveryInfo});
}

class InitializedState extends QRScanState {
  InitializedState() : super(deliveryInfo: null);
}

class LoadingInfoState extends QRScanState {
  LoadingInfoState() : super(deliveryInfo: null);
}

class QRInfoState extends QRScanState {
  QRInfoState(DeliveryInfo deliveryInfo) : super(deliveryInfo: deliveryInfo);
}
