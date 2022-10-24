import 'package:flutter/material.dart';

class ListMateriItem {
  String nama;
  ListMateriItem({
    required this.nama,
  });
}

List<ListMateriItem> listMateriItem = [
  ListMateriItem(nama: 'Percobaan Kalor Reaksi'),
  ListMateriItem(
      nama: 'Materi dan Sifatnya, serta Kegunaan Bahan Kimia dalam Kehidupan'),
  ListMateriItem(nama: 'Termokimia'),
  ListMateriItem(nama: 'Termokimia (2)'),
  ListMateriItem(nama: 'Chemistry Book'),
  ListMateriItem(nama: 'Video Perubahan Materi dan Reaksi Kimia'),
];
