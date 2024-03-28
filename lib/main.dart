import 'package:ejercicio/view/delivery_info_view/delivery_info_view.dart';
import 'package:ejercicio/view/home_view/home_view.dart';
import 'package:ejercicio/view/qr_scan_view/qr_scan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/qr_scan_view/bloc/bloc.dart';

void main() {
  runApp(const MyApp());
}

final qrScanBloc = QRScanBloc();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ejecicio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/qr-scan': (context) =>
            BlocProvider.value(value: qrScanBloc, child: const QrScanView()),
        '/delivery-info': (context) => BlocProvider.value(
            value: qrScanBloc, child: const DeliveryInfoView()),
      },
    );
  }
}
// import 'package:ejercicio/view/delivery_info_view/delivery_info_view.dart';
// import 'package:ejercicio/view/home_view/home_view.dart';
// import 'package:ejercicio/view/qr_scan_view/qr_scan_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'view/qr_scan_view/bloc/bloc.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<QRScanBloc>(create: (BuildContext context) => QRScanBloc())
//       ],
//       child: MaterialApp(
//         title: 'Flutter Ejecicio',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         initialRoute: '/',
//         routes: {
//           '/': (context) => const HomeView(),
//           '/qr-scan': (context) => const QrScanView(),
//           '/delivery-info': (context) => const DeliveryInfoView(),
//         },
//       ),
//     );
//   }
// }
