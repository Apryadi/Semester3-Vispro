void main() {
  // Kapasitas awal baterai
  double bateraiAwal = 100.0;

  // Penggunaan aplikasi dalam menit
  int chattingDuration = 60; // 60 menit untuk chatting
  int videoDuration = 30;     // 30 menit untuk menonton video
  int gameDuration = 45;      // 45 menit untuk bermain game

  // Penggunaan baterai per 5 menit
  double batteryUsageChatting = 1.0; // 1% setiap 5 menit
  double batteryUsageVideo = 2.0;     // 2% setiap 5 menit
  double batteryUsageGame = 3.0;      // 3% setiap 5 menit

  // Menghitung total penggunaan baterai
  double totalBatteryUsage = 0;

  // Hitung penggunaan baterai untuk chatting
  totalBatteryUsage += (chattingDuration / 5) * batteryUsageChatting;

  // Hitung penggunaan baterai untuk menonton video
  totalBatteryUsage += (videoDuration / 5) * batteryUsageVideo;

  // Hitung penggunaan baterai untuk bermain game
  totalBatteryUsage += (gameDuration / 5) * batteryUsageGame;

  // Menghitung sisa baterai
  double sisaBaterai = bateraiAwal - totalBatteryUsage;

  // Menampilkan sisa baterai
  print("Sisa baterai setelah penggunaan adalah: ${sisaBaterai.toStringAsFixed(2)}%");
}