// Fungsi untuk menukar elemen
void swap(List<int> list, int left, int right) {
  int temp = list[left];
  list[left] = list[right];
  list[right] = temp;
}

// Fungsi untuk memeriksa kondisi indeks dan melakukan swap
bool processInversion(List<int> list, int left, int right) {
  if (left < right) {  // If tunggal
    swap(list, left, right);
    return true;
  }
  return false;
}

// Fungsi untuk mengatur penghitungan indeks
int adjustIndex(int index, bool increment) {
  return increment ? index + 1 : index - 1;
}

// Fungsi countInversions dengan waktu eksekusi
List<int> countInversions(List<int> list) {
  int left = 0;
  int right = list.length - 1;
  
  // Mulai pengukuran waktu
  DateTime startTime = DateTime.now();
  
  while (left < right) {  // While tunggal
    if (processInversion(list, left, right)) {
      left = adjustIndex(left, true);
      right = adjustIndex(right, false);
    }
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
  List<int> numbers = [1, 2, 3, 4, 5];

  // Panggil countInversions dan cetak hasil
  List<int> invertedNumbers = countInversions(numbers);
  print("List setelah dibalik: $invertedNumbers");
}
