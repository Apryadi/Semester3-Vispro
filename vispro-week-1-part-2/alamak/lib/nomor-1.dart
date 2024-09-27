import 'dart:io';

void main() {
  // Harga per kilogram
  int hargaApel = 5000;
  int hargaJeruk = 4000;

  // Menampilkan pilihan kepada pengguna
  print("Pilih buah yang ingin dibeli:");
  print("1. Apel");
  print("2. Jeruk");
  print("3. Apel dan Jeruk");

  // Meminta input pilihan dari pengguna
  stdout.write("Masukkan pilihan Anda (1/2/3): ");
  String? pilihan = stdin.readLineSync();

  // Menggunakan switch-case untuk mengelola pilihan
  switch (pilihan) {
    case "1":
      stdout.write("Masukkan jumlah kilogram apel yang dibeli: ");
      double kgApel = double.parse(stdin.readLineSync()!);
      double totalHarga = kgApel * hargaApel;
      print("Total harga yang harus dibayar: Rp ${totalHarga.toInt()}");
      break;

    case "2":
      stdout.write("Masukkan jumlah kilogram jeruk yang dibeli: ");
      double kgJeruk = double.parse(stdin.readLineSync()!);
      double totalHarga = kgJeruk * hargaJeruk;
      print("Total harga yang harus dibayar: Rp ${totalHarga.toInt()}");
      break;

    case "3":
      stdout.write("Masukkan jumlah kilogram apel yang dibeli: ");
      double kgApel = double.parse(stdin.readLineSync()!);
      stdout.write("Masukkan jumlah kilogram jeruk yang dibeli: ");
      double kgJeruk = double.parse(stdin.readLineSync()!);
      double totalHargaApel = kgApel * hargaApel;
      double totalHargaJeruk = kgJeruk * hargaJeruk;
      double totalHarga = totalHargaApel + totalHargaJeruk;
      print("Total harga yang harus dibayar: Rp ${totalHarga.toInt()}");
      break;

    default:
      print("Pilihan tidak valid!");
  }
}
