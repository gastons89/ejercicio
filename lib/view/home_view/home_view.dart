import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: const Size(100, 100),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)
                      ),
            ),
            child: const Icon(
              Icons.qr_code_rounded,
              color: Colors.white,
              size: 50.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/qr-scan');
            },
          ),
          const SizedBox(height: 10),
          const Text(
            "Escanear QR",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24
            ),
          ),
        ],
      )),
    );
  }
}
