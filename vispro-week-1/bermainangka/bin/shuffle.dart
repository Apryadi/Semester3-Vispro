import 'dart:math';

// Fungsi untuk menukar dua elemen dalam list
void swap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

// Fungsi untuk memilih indeks acak
int getRandomIndex(Random random, int max) {
  return random.nextInt(max + 1);
}

// Fungsi untuk melakukan shuffle dengan while tunggal
List<int> performShuffle(List<int> list, Random random) {
  int i = list.length;
  while (i > 1) {  // While tunggal
    i--;
    int j = getRandomIndex(random, i);  // Dapatkan indeks acak
    swap(list, i, j);  // Tukar elemen
  }
  return list;
}

// Fungsi utama shuffle dengan waktu eksekusi
List<int> shuffle(List<int> list) {
  Random random = Random();

  // Mulai pengukuran waktu
  DateTime startTime = DateTime.now();
  
  // Panggil fungsi untuk melakukan shuffle
  list = performShuffle(list, random);

  // Selesai pengukuran waktu
  DateTime endTime = DateTime.now();
  Duration executionTime = endTime.difference(startTime);

  // Cetak waktu eksekusi
  print("Waktu eksekusi: ${executionTime.inMilliseconds} ms");

  return list;
}

void main() {
  // Contoh list
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // Panggil shuffle dan cetak hasil
  List<int> shuffledNumbers = shuffle(numbers);
  print("List setelah di-shuffle: $shuffledNumbers");
}
