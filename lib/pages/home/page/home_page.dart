import 'package:flutter/material.dart';
import 'qr_scanner_page.dart';
import 'maps_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Главная"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Добро пожаловать", style: TextStyle(fontSize: 24.0)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QRScannerPage()),
                    );
                  },
                  icon: const Icon(Icons.qr_code),
                  label: const Text("QR-код"),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapsPage()),
                    );
                  },
                  icon: const Icon(Icons.map),
                  label: const Text("Карта"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}