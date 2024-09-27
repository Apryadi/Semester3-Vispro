void main() {
  // Daftar barang dengan berat dan nilai
  List<Item> barang = [
    Item('Makanan', 3, 50),
    Item('Pakaian', 2, 30),
    Item('Alat Masak', 4, 40),
    Item('Tenda', 5, 70),
    Item('Sleeping Bag', 2, 20)
  ];

  int kapasitasRansel = 10; // Kapasitas maksimal ransel
  List<Item> hasil = [];
  int nilaiTertinggi = 0;

  // Menghitung kombinasi barang dengan brute force
  int totalBarang = barang.length;
  for (int i = 0; i < (1 << totalBarang); i++) {
    List<Item> kombinasi = [];
    int totalBerat = 0;
    int totalNilai = 0;

    for (int j = 0; j < totalBarang; j++) {
      // Jika j adalah bagian dari kombinasi
      if ((i & (1 << j)) != 0) {
        kombinasi.add(barang[j]);
        totalBerat += barang[j].berat;
        totalNilai += barang[j].nilai;
      }
    }

    // Jika total berat dalam kapasitas dan nilai lebih tinggi
    if (totalBerat <= kapasitasRansel && totalNilai > nilaiTertinggi) {
      nilaiTertinggi = totalNilai;
      hasil = kombinasi;
    }
  }

  // Menampilkan hasil
  print("Kombinasi barang dengan nilai tertinggi:");
  for (var item in hasil) {
    print("${item.nama} (Berat: ${item.berat} kg, Nilai: ${item.nilai})");
  }
  print("Total nilai: $nilaiTertinggi");
}

class Item {
  String nama;
  int berat;
  int nilai;

  Item(this.nama, this.berat, this.nilai);
}
