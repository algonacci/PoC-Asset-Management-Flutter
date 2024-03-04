// AssetInfoPage.dart
import 'package:flutter/material.dart';

class AssetInfoPage extends StatelessWidget {
  final Map<String, dynamic> assetData;

  const AssetInfoPage({super.key, required this.assetData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Details'),
      ),
      body: Column(
        children: [
          Image.network(assetData['url_gambar']),
          Text('Deskripsi: ${assetData['deskripsi']}'),
          Text('Penyusutan: ${assetData['penyusutan']}'),
          Text('Harga: ${assetData['harga_rupiah']}'),
          Text('Tanggal Pembelian: ${assetData['tanggal_pembelian']}'),
        ],
      ),
    );
  }
}
