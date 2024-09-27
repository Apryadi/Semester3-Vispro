import 'dart:io';

// Fungsi untuk menukar elemen
void swap(List<int> list, int index1, int index2) {
  int temp = list[index1];
  list[index1] = list[index2];
  list[index2] = temp;
}

// Fungsi untuk membandingkan dua elemen dalam list
bool compareAndSwap(List<int> list, int index) {
  if (list[index] > list[index + 1]) {
    swap(list, index, index + 1);
    return true;
  }
  return false;
}

// Fungsi untuk mengulang proses per-elemen menggunakan while
bool performSwaps(List<int> list, int n, int i) {
  bool swapped = false;
  int index = 0;
  while (index < n - i - 1) {  // While tunggal sesuai aturan
    if (compareAndSwap(list, index)) {
      swapped = true;
    }
    index++;
  }
  return swapped;
}

// Fungsi bubbleSort dengan waktu eksekusi
List<int> bubbleSort(List<int> list) {
  int n = list.length;
  int i = 0;
  bool swapped = true;
  
  // Mulai pengukuran waktu
  DateTime startTime = DateTime.now();
  
  // Proses sorting
  while (swapped) {  // While tunggal
    swapped = performSwaps(list, n, i);
    i++;
  }

  // Selesai pengukuran waktu
  DateTime endTime = DateTime.now();
  Duration executionTime = endTime.difference(startTime);

  // Cetak waktu eksekusi
  print("Waktu eksekusi: ${executionTime.inMilliseconds} ms");
  
  return list;
}

void main() {
  // Contoh list
  List<int> numbers = [64, 34, 25, 12, 22, 11, 90];

  // Panggil bubbleSort dan cetak hasil
  List<int> sortedNumbers = bubbleSort(numbers);
  print("List setelah diurutkan: $sortedNumbers");
}
