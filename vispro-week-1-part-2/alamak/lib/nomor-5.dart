import 'dart:io';

void main() {
  // Tarif parkir
  const int tarifDuaJamPertama = 2000; // Rp 2.000 untuk 2 jam pertama
  const int tarifSetelahDuaJam = 1000;  // Rp 1.000 untuk setiap jam berikutnya

  // Meminta input jumlah jam parkir dari pengguna
  print("Masukkan jumlah jam parkir: ");
  String? input = stdin.readLineSync();

  // Mengonversi input menjadi int
  int jamParkir = int.parse(input!);

  // Menghitung total biaya parkir
  int totalBiaya = 0;

  if (jamParkir <= 2) {
    totalBiaya = tarifDuaJamPertama;
  } else {
    // Biaya untuk 2 jam pertama
    totalBiaya = tarifDuaJamPertama;
    // Menambahkan biaya untuk jam setelah 2 jam
    totalBiaya += (jamParkir - 2) * tarifSetelahDuaJam;
  }

  // Menampilkan total biaya parkir
  print("Total biaya parkir untuk $jamParkir jam adalah Rp $totalBiaya");
}
