void main() {
  // Kapasitas produksi
  int unitPerJam = 20;      // unit barang yang diproduksi per jam
  int jamOperasiPerHari = 8; // jam operasional per hari
  int hariKerjaPerMinggu = 5; // hari kerja per minggu

  // Menghitung total unit barang yang dihasilkan dalam satu minggu
  int totalUnitPerHari = unitPerJam * jamOperasiPerHari;
  int totalUnitPerMinggu = totalUnitPerHari * hariKerjaPerMinggu;

  // Menampilkan hasil
  print("Total unit barang yang dihasilkan dalam satu minggu adalah: $totalUnitPerMinggu unit");
}
