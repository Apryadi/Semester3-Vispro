import 'dart:io';

void main() {
  // Tarif parkir
  const int tarifAwal = 2000; // Tarif untuk 2 jam pertama (per jam)
  const int tarifTambahan = 1000; // Tarif untuk setiap jam berikutnya

  // Meminta input jumlah jam parkir
  stdout.write('Masukkan jumlah jam parkir: ');
  String? inputJamParkir = stdin.readLineSync();
  int jamParkir = int.parse(inputJamParkir!);

  // Menghitung total biaya parkir
  int totalBiaya;
  if (jamParkir <= 2) {
    totalBiaya = jamParkir * tarifAwal;
  } else {
    totalBiaya = (2 * tarifAwal) + ((jamParkir - 2) * tarifTambahan);
  }

  // Menampilkan total biaya parkir
  stdout.write('Total biaya parkir untuk $jamParkir jam adalah Rp $totalBiaya');
}