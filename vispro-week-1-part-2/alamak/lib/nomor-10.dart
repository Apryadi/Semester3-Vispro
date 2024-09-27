void main() {
  // Daftar nasabah yang akan dilayani
  List<String> nasabah = ['A', 'B', 'C', 'D', 'E'];

  // Menyimpan urutan pelayanan
  List<String> urutanPelayanan = [];

  // Mensimulasikan antrian
  for (int i = 0; i < nasabah.length; i++) {
    if (i % 2 == 0) {
      // Nasabah di loket 1
      urutanPelayanan.add('Nasabah ${nasabah[i]} dilayani di Loket 1');
    } else {
      // Nasabah di loket 2
      urutanPelayanan.add('Nasabah ${nasabah[i]} dilayani di Loket 2');
    }
  }

  // Menampilkan urutan pelayanan
  print("Urutan pelayanan nasabah:");
  for (var pelayanan in urutanPelayanan) {
    print(pelayanan);
  }
}