import 'package:flutter/material.dart';

class GlosariumItem {
  String nama;
  String deskripsi;
  GlosariumItem({
    required this.nama,
    required this.deskripsi,
  });
}

List<GlosariumItem> glosariumItem = [
  GlosariumItem(
    nama: 'Item1',
    deskripsi: 'Ini adalah deskripsi untuk item 1',
  ),
  GlosariumItem(
    nama: 'Item2',
    deskripsi: 'Ini adalah deskripsi untuk item 3',
  ),
  GlosariumItem(
    nama: 'Item3',
    deskripsi: 'Ini adalah deskripsi untuk item 4',
  ),
];
