import 'dart:io';

void main() {
  // Meminta input suhu dalam Celsius dari pengguna
  print("Masukkan suhu dalam Celsius: ");
  String? input = stdin.readLineSync();

  // Mengonversi input menjadi double
  double celsius = double.parse(input!);

  // Menghitung suhu dalam Fahrenheit
  double fahrenheit = (9 / 5) * celsius + 32;

  // Menampilkan hasil konversi
  print("Suhu dalam Fahrenheit adalah: $fahrenheit");
}
