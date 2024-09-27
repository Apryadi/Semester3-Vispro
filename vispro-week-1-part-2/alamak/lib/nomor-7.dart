import 'dart:io';

void main() {
  // Menyimpan urutan tugas berdasarkan prioritas
  List<String> tugas = [];

  // Menentukan urutan tugas
  // Tugas A harus diselesaikan sebelum Tugas B
  tugas.add("Tugas A");
  tugas.add("Tugas B");

  // Tugas C harus selesai setelah A dan B, tetapi sebelum D
  tugas.add("Tugas C");

  // Tugas D harus selesai setelah C
  tugas.add("Tugas D");

  // Meminta pengguna memasukkan posisi Tugas E
  print("Di mana Anda ingin menempatkan Tugas E? (0-4): ");
  int posisiE = int.parse(stdin.readLineSync()!);

  // Menambahkan Tugas E sesuai posisi yang dipilih
  if (posisiE >= 0 && posisiE <= tugas.length) {
    tugas.insert(posisiE, "Tugas E");
  } else {
    print("Posisi tidak valid, Tugas E akan ditambahkan di akhir.");
    tugas.add("Tugas E");
  }

  // Menampilkan urutan penyelesaian tugas
  print("\nUrutan penyelesaian tugas yang efisien:");
  tugas.asMap().forEach((i, tugas) {
    print("${i + 1}. $tugas");
  });
}
