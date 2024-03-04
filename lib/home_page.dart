import 'package:flutter/material.dart';
import 'package:poc_asset_management_flutter/button.dart';
import 'package:poc_asset_management_flutter/qr_scanner_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Management App'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QRScannerPage()),
            );
          },
          child: Button(
            text: 'Scan QR Code',
            icon: Icons.qr_code,
          ),
        ),
      ),
    );
  }
}
