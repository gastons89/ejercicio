import 'package:ejercicio/repository/irepository.dart';
import 'package:ejercicio/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class QRScanBloc extends Bloc<QRScanEvent, QRScanState> {
  late IRepository _repository;

  QRScanBloc() : super(InitializedState()) {
    _repository = Repository();
    on<GetInfoQREvent>((event, emit) async {
      await scanQR(emit, event);
    });

    on<ResetQRStateEvent>((event, emit) => retartState(emit, event));
  }

  scanQR(Emitter<QRScanState> emit, QRScanEvent event) async {
    if (event is GetInfoQREvent) {
      emit(LoadingInfoState());
      final response = await _repository.getDeliveryInfo(event.qrIfno);
      emit(QRInfoState(response));
    }
  }

  retartState(Emitter<QRScanState> emit, QRScanEvent event) {
    emit(InitializedState());
  }
}
