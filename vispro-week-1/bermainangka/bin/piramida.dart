import 'dart:io';
import 'dart:math';

// Fungsi untuk menghasilkan list angka acak
List<int> generateRandomNumbers(int count) {
  Random random = Random();
  List<int> numbers = [];
  int i = 0;

  while (i < count) {  // While tunggal
    numbers.add(random.nextInt(100));
    i++;
  }
  return numbers;
}

// Fungsi untuk mengambil sublist elemen dari daftar angka
String getSublistString(List<int> list, int start, int end) {
  List<int> sublist = [];
  int i = start;
  
  while (i < end) {  // While tunggal
    sublist.add(list[i]);
    i++;
  }
  return sublist.join(' ');
}

// Fungsi untuk menghasilkan baris piramida
String generatePyramidRow(List<int> angkaList, int tinggi, int i) {
  String spasi = ' ' * (tinggi - (i + 1));
  String angka = getSublistString(
    angkaList,
    (i * (i + 1)) ~/ 2,
    ((i + 1) * (i + 2)) ~/ 2,
  );
  return '$spasi$angka';
}

// Fungsi utama untuk mencetak piramida dengan waktu eksekusi
void piramidaAcak(int tinggi) {
  // Mulai pengukuran waktu
  DateTime startTime = DateTime.now();

  // Hitung jumlah elemen
  int totalElemen = (tinggi * (tinggi + 1)) ~/ 2;

  // Generate angka acak
  List<int> angkaList = generateRandomNumbers(totalElemen);
  
  int i = 0;
  List<String> piramida = [];
  
  while (i < tinggi) {  // While tunggal
    piramida.add(generatePyramidRow(angkaList, tinggi, i));
    i++;
  }

  // Selesai pengukuran waktu
  DateTime endTime = DateTime.now();
  Duration executionTime = endTime.difference(startTime);

  // Cetak piramida dan waktu eksekusi
  stdout.write(piramida.join('\n'));
  print("\nWaktu eksekusi: ${executionTime.inMilliseconds} ms");
}

void main() {
  // Panggil piramidaAcak dengan tinggi piramida
  piramidaAcak(5);
}
