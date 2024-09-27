void main() {
  // Jumlah mesin cuci dan waktu yang dapat digunakan
  int jumlahMesinCuci = 3;
  double waktuPerMesinCuci = 2.0; // jam
  double waktuCuciPerPenghuni = 1.5; // jam

  // Total waktu yang tersedia untuk mencuci
  double totalWaktuTersedia = jumlahMesinCuci * waktuPerMesinCuci;

  // Menghitung jumlah penghuni yang dapat mencuci
  int jumlahPenghuniDapatMencuci = (totalWaktuTersedia / waktuCuciPerPenghuni).floor();

  // Menampilkan hasil
  print("Jumlah penghuni yang dapat mencuci di hari yang sama: $jumlahPenghuniDapatMencuci");
}
