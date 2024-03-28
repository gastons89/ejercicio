import 'package:ejercicio/model/delivery_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../qr_scan_view/bloc/bloc.dart';

class DeliveryInfoView extends StatelessWidget {
  const DeliveryInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final deliverInfo =
        ModalRoute.of(context)?.settings.arguments as DeliveryInfo;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Información del envio',
          ),
          leading: BackButton(onPressed: () {
            BlocProvider.of<QRScanBloc>(context).add(ResetQRStateEvent());
            Navigator.pop(context);
          }),
          centerTitle: true),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                  child: Text(
                'ID:',
              )),
              Flexible(flex: 3, child: Text(deliverInfo.idDelivery!))
            ],
          ),
          const Divider(),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Expanded(child: Text('Remitente:')),
              Flexible(flex: 3, child: Text(deliverInfo.sender!))
            ],
          ),
          const Divider(),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Expanded(child: Text('Destinatario:')),
              Flexible(flex: 3, child: Text(deliverInfo.addressee!))
            ],
          ),
          const Divider(),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Expanded(child: Text('Estado:')),
              Flexible(flex: 3, child: Text(deliverInfo.stateDelivery!))
            ],
          ),
          const Divider(),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onPressed: () => Navigator.popUntil(
                        context, (route) => route.settings.name == '/'),
                    child: const Text(
                      'Ir al inicio',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
