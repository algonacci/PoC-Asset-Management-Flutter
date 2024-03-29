// QRScannerPage.dart
import 'package:flutter/material.dart';
import 'package:poc_asset_management_flutter/asset_info_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isProcessing = false; // Flag to indicate if we're processing a scan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isProcessing) {
        // Check if we're not already processing a scan
        isProcessing = true; // Set processing to true
        _fetchAssetData(scanData.code!);
      }
    });
  }

  void _fetchAssetData(String url) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer SECRET', // Replace SECRET with actual token
        },
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var assetData = jsonData['data'][0];
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssetInfoPage(assetData: assetData),
          ),
        );
      } else {
        print(response.statusCode);
        throw Exception('Failed to load asset data');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error appropriately
    } finally {
      // Resume scanning after pushing the AssetInfoPage or if an error occurs
      controller?.resumeCamera();
      isProcessing = false; // Reset processing to false
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
