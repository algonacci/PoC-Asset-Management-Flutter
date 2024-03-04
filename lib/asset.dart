class Asset {
  final int id;
  final String nama;
  final String deskripsi;
  final String penyusutan;
  final String urlGambar;
  final int harga;
  final String hargaRupiah;
  final String tanggalPembelian;

  Asset({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.penyusutan,
    required this.urlGambar,
    required this.harga,
    required this.hargaRupiah,
    required this.tanggalPembelian,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      penyusutan: json['penyusutan'],
      urlGambar: json['url_gambar'],
      harga: json['harga'],
      hargaRupiah: json['harga_rupiah'],
      tanggalPembelian: json['tanggal_pembelian'],
    );
  }
}
