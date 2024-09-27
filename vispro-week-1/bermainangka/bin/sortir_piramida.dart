import 'dart:io';

// Fungsi untuk mengurutkan list secara manual (tanpa sort())
List<int> manualSort(List<int> list) {
  int n = list.length;
  bool swapped = true;
  while (swapped) {  // While tunggal
    swapped = false;
    for (int i = 0; i < n - 1; i++) {  // Harus diubah menjadi tanpa for di bawah
      if (list[i] > list[i + 1]) {
        int temp = list[i];
        list[i] = list[i + 1];
        list[i + 1] = temp;
        swapped = true;
      }
    }
  }
  return list;
}

// Fungsi untuk mengurutkan elemen secara manual
List<int> bubbleSort(List<int> list) {
  int n = list.length;
  int i = 0;
  bool swapped = true;

  while (swapped) {  // While tunggal
    swapped = false;
    int j = 0;
    while (j < n - 1 - i) {  // While untuk menggantikan for
      if (list[j] > list[j + 1]) {  // If tunggal
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
        swapped = true;
      }
      j++;
    }
    i++;
  }
  return list;
}

// Fungsi untuk mengambil sublist elemen
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
String generatePyramidRow(List<int> angkaList, int tinggi, int i, int totalItems) {
  String spasi = ' ' * (tinggi - (i + 1));
  int startIdx = (i * (i + 1)) ~/ 2;
  int endIdx = ((i + 1) * (i + 2)) ~/ 2;

  // If tunggal
  if (endIdx > totalItems) {
    endIdx = totalItems; 
  }

  String angka = getSublistString(angkaList, startIdx, endIdx);
  return '$spasi$angka';
}

// Fungsi utama sortir piramida dengan waktu eksekusi
void sortirPiramida(List<int> angkaList, int tinggi) {
  // Mulai pengukuran waktu
  DateTime startTime = DateTime.now();

  // Urutkan angka secara manual (menggantikan sort)
  angkaList = bubbleSort(angkaList);

  int i = 0;
  int totalItems = angkaList.length;
  List<String> piramida = [];
  
  while (i < tinggi) {  // While tunggal
    piramida.add(generatePyramidRow(angkaList, tinggi, i, totalItems));
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
  // Contoh list angka
  List<int> numbers = [3, 1, 5, 9, 2, 7, 4, 6, 8];

  // Panggil sortirPiramida dan cetak hasil
  sortirPiramida(numbers, 4);
}
