abstract class QRScanEvent {
}

class GetInfoQREvent extends QRScanEvent {
  final String qrIfno;

  GetInfoQREvent({required this.qrIfno});
}

class ResetQRStateEvent extends QRScanEvent {
  ResetQRStateEvent();
}
