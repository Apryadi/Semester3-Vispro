import 'dart:io';
import 'dart:core';
import 'dart:math';
import 'piramida.dart' as piramidaLib;
import 'sortir_piramida.dart' as sortirPiramidaLib;
import 'shuffle.dart';
import 'bubble_sort.dart';
import 'inversion.dart';

// Fungsi utama yang menjalankan program
void main() {
  print("Masukkan angka: ");
  int? n = int.parse(stdin.readLineSync()!);

  // Generate angka acak
  List<int> numbers = generateRandomNumbers(n);

  print("Angka yang di-generate: $numbers");

  print("Pilih metode: ");
  print("1. Bubble Sort");
  print("2. Inversi");
  print("3. Shuffle");
  print("4. Sortir Piramida");
  print("5. Piramida Acak");
  int? pilihan = int.parse(stdin.readLineSync()!);

  // Mulai stopwatch
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  // Gunakan satu if untuk mengecek pilihan
  if (pilihan >= 1 && pilihan <= 5) {
    performOperation(numbers, pilihan);
  } else {
    print("Pilihan tidak valid");
  }

  // Berhenti stopwatch
  stopwatch.stop();

  // Cetak waktu eksekusi setelah hasil
  print("\nWaktu eksekusi: ${stopwatch.elapsedMicroseconds} microseconds");
}

// Fungsi untuk melakukan operasi yang dipilih
void performOperation(List<int> numbers, int pilihan) {
  // Switch case untuk memilih metode operasi
  switch (pilihan) {
    case 1:
      print("Hasil Bubble Sort: ${bubbleSort(numbers)}");
      break;
    case 2:
      print("Jumlah Inversi: ${countInversions(numbers)}");
      break;
    case 3:
      print("Hasil Shuffle: ${shuffle(numbers)}");
      break;
    case 4:
      // Menghitung tinggi piramida berdasarkan jumlah angka
      int height = calculatePyramidHeight(numbers.length);
      print("Hasil Sortir Piramida: ");
      sortirPiramidaLib.sortirPiramida(numbers, height); // Gunakan alias 'sortirPiramidaLib'
      break;
    case 5:
      // Menghitung tinggi piramida berdasarkan jumlah angka
      int height = calculatePyramidHeight(numbers.length);
      print("Piramida Acak: ");
      piramidaLib.piramidaAcak(height); // Gunakan alias 'piramidaLib'
      break;
  }
}

// Fungsi untuk menghitung tinggi piramida berdasarkan jumlah angka
int calculatePyramidHeight(int length) {
  return (sqrt(length * 2)).floor();
}

// Fungsi untuk menghasilkan list angka acak
List<int> generateRandomNumbers(int n) {
  Random random = Random();
  List<int> numbers = [];
  int i = 0;
  
  while (i < n) {  // While tunggal
    numbers.add(random.nextInt(100));
    i++;
  }
  
  return numbers;
}
