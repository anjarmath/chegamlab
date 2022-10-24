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
    nama: 'Makroskopik',
    deskripsi:
        'Mengacu pada pengamatan fenomena kimia langsung yang dialami oleh seseorang dari percobaan di laboratorium atau di dalam kehidupan sehari-hari.',
  ),
  GlosariumItem(
    nama: 'Sub-mikroskopik',
    deskripsi:
        'Menjelaskan mengenai struktur dan proses pada level partikel (atom/molekular) terhadap fenomena makroskopik yang diamati.',
  ),
  GlosariumItem(
    nama: 'Simbolik',
    deskripsi:
        'Menjelaskan secara kualitatif dan kuantitatif, yaitu rumus kimia, diagram, gambar, persamaan reaksi, stoikiometri dan perhitungan matematik',
  ),
  GlosariumItem(
    nama: 'Penguapan/ Evaporasi',
    deskripsi:
        'Bagian perubahan molekul di dalam kondisi cair (contohnya cairan) dengan spontan dijadikan gas (contohnya uap air).',
  ),
  GlosariumItem(
    nama: 'Krital/ Hablur',
    deskripsi:
        'Suatu padatan yang atom, molekul, atau ion penyusunnya terkemas secara teratur dan polanya berulang melebar secara tiga dimensi.',
  ),
  GlosariumItem(
    nama: 'Fasa',
    deskripsi:
        'Keadaan yang berbeda dan homogen dari suatu sistem tanpa batas yang terlihat memisahkannya menjadi bagian bagian.',
  ),
  GlosariumItem(
    nama: 'Termodinamika',
    deskripsi:
        'Kajian matematika tentang keterkaitan selang kalor dan kerja dengan reaksi kimia atau dengan perubahan keadaan fisik dalam batas-batas hukum-hukum termodinamika',
  ),
  GlosariumItem(
    nama: 'Termokimia',
    deskripsi:
        'Ilmu kimia yang mempelajari hubungan antara kalor (energi panas) dengan reaksi kimia atau proses-proses yang berhubungan dengan reaksi kimia',
  ),
  GlosariumItem(
    nama: 'Eksoterm',
    deskripsi: 'Suatu reaksi kimia yang menghasilkan kalor atau panas',
  ),
  GlosariumItem(
    nama: 'Endoterm',
    deskripsi: 'Reaksi yang menyerap kalor.',
  ),
  GlosariumItem(
    nama: 'Ion',
    deskripsi:
        'Suatu atom atau molekul yang memiliki muatan listrik total tidak nol (jumlah total elektron tidak sama dengan jumlah total proton).',
  ),
  GlosariumItem(
    nama: 'Kalor Netralisasi',
    deskripsi:
        'Kalor yang dilepaskan pada penetralan 1 mol ion H+ dari asam dengan 1 mol ion OH– dari basa',
  ),
  GlosariumItem(
    nama: 'Ekstrapolasi',
    deskripsi:
        'Proses memperkirakan nilai suatu variabel melampaui interval pengamatan aslinya berdasarkan hubungannya dengan variabel lainnya',
  ),
  GlosariumItem(
    nama: 'Kalor Jenis',
    deskripsi:
        'Banyaknya kalor yang diperlukan untuk menaikan suhu dari 1 kg massa menjadi 1 ◦C',
  ),
  GlosariumItem(
    nama: 'Sistem Isolasi',
    deskripsi:
        'Sistem yang tidak memungkinkan terjadinya perpindahan kalor serta perpindahan massa baik dari lingkungan ke sistem ataupun sebaliknya',
  ),
];
