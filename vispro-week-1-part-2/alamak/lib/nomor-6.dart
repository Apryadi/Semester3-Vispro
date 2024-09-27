import 'dart:io';

void main() {
  // Gaji pokok dan bonus
  const int gajiPokok = 4000000; // Rp 4.000.000
  const int bonus = 200000;       // Rp 200.000 bonus jika lebih dari 40 jam

  // Meminta input jumlah jam kerja dari pengguna
  print("Masukkan jumlah jam kerja per minggu: ");
  String? input = stdin.readLineSync();

  // Mengonversi input menjadi int
  int jamKerja = int.parse(input!);

  // Menghitung gaji total
  int gajiTotal = gajiPokok;

  // Menambahkan bonus jika jam kerja lebih dari 40
  if (jamKerja > 40) {
    gajiTotal += bonus;
  }

  // Menampilkan gaji total
  print("Gaji total karyawan adalah Rp $gajiTotal");
}