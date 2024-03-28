import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'bloc/bloc.dart';

class QrScanView extends StatefulWidget {
  const QrScanView({super.key});

  @override
  State<QrScanView> createState() => _QrScanViewState();
}

class _QrScanViewState extends State<QrScanView> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Escaner QR',
          ),
          centerTitle: true),
      body: BlocConsumer<QRScanBloc, QRScanState>(
        builder: (context, state) {
          if (state is InitializedState) {
            return QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        listener: (context, state) {
          if (state is QRInfoState) {
            Navigator.pushNamed(context, '/delivery-info',
                arguments: state.deliveryInfo);
          }
        },
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      BlocProvider.of<QRScanBloc>(context)
          .add(GetInfoQREvent(qrIfno: scanData.code!));
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
