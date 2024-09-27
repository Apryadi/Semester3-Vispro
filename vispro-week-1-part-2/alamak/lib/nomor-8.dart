import 'dart:io';

// Fungsi untuk menghitung total konsumsi energi
double hitungKonsumsi(double konsumsiPerJam, int durasi) {
  return konsumsiPerJam * durasi;
}

void main() {
  // Konsumsi energi per jam dalam kWh
  const double konsumsiAC = 1.5; // AC mengonsumsi 1.5 kWh per jam
  const double konsumsiTV = 0.2;  // TV mengonsumsi 0.2 kWh per jam
  const double konsumsiLampu = 0.1; // Lampu mengonsumsi 0.1 kWh per jam

  // Meminta input dari pengguna untuk durasi penggunaan alat
  print("Masukkan durasi penggunaan AC (jam): ");
  int durasiAC = int.parse(stdin.readLineSync()!);

  print("Masukkan durasi penggunaan TV (jam): ");
  int durasiTV = int.parse(stdin.readLineSync()!);

  print("Masukkan durasi penggunaan Lampu (jam): ");
  int durasiLampu = int.parse(stdin.readLineSync()!);

  // Menghitung total konsumsi energi harian
  double totalKonsumsi = hitungKonsumsi(konsumsiAC, durasiAC) +
                         hitungKonsumsi(konsumsiTV, durasiTV) +
                         hitungKonsumsi(konsumsiLampu, durasiLampu);

  // Menampilkan total konsumsi energi harian
  print("\nTotal konsumsi energi harian keluarga adalah: ${totalKonsumsi.toStringAsFixed(2)} kWh");
}