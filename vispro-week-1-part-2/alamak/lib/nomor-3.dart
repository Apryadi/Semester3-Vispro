import 'dart:io';

void main() {
  // Konstanta nilai π
  const double pi = 3.14;

  // Meminta input diameter dari pengguna
  print("Masukkan diameter lingkaran: ");
  String? input = stdin.readLineSync();

  // Mengonversi input menjadi double
  double diameter = double.parse(input!);

  // Menghitung jari-jari
  double jariJari = diameter / 2;

  // Menghitung luas lingkaran
  double luas = pi * jariJari * jariJari;

  // Menampilkan hasil
  print("Luas lingkaran dengan diameter $diameter adalah $luas");
}