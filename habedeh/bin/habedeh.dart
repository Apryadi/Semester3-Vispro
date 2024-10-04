import 'dart:io';
import 'apalah.dart' as color;
import 'main.dart' as main;

// Function buat pindahin kursor ke koordinat tertentu
void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

// Function buat nge-print frame 1 (kembang api sebelum ledak)
void printFrame1(int centerX, int centerY, String colorSelect) {
  moveTo(centerY, centerX);
  stdout.write('${colorSelect}|${color.RESET}');
}

// Function buat nge-print frame 2 (kembang api mulai meledak, versi gede)
void printFrame2(int centerX, int centerY, String colorSelect) {
  moveTo(centerY - 2, centerX);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY + 2, centerX);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY, centerX - 2);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY, centerX + 2);
  stdout.write('${colorSelect}*${color.RESET}');
  
  // Tambah efek kecil di sekitar
  moveTo(centerY - 1, centerX - 1);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY - 1, centerX + 1);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY + 1, centerX - 1);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY + 1, centerX + 1);
  stdout.write('${colorSelect}*${color.RESET}');
}

// Function buat nge-print frame 3 (ledakan penuh, versi gede)
void printFrame3(int centerX, int centerY, String colorSelect) {
  moveTo(centerY - 3, centerX);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY + 3, centerX);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY, centerX - 3);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY, centerX + 3);
  stdout.write('${colorSelect}*${color.RESET}');
  
  // Pojok kanan kiri
  moveTo(centerY - 2, centerX - 2);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY - 2, centerX + 2);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY + 2, centerX - 2);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY + 2, centerX + 2);
  stdout.write('${colorSelect}*${color.RESET}');
  
  // Lingkaran luar
  moveTo(centerY - 1, centerX - 3);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY - 1, centerX + 3);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY + 1, centerX - 3);
  stdout.write('${colorSelect}*${color.RESET}');
  moveTo(centerY + 1, centerX + 3);
  stdout.write('${colorSelect}*${color.RESET}');
}

// Function buat nge-clear layar
void clearScreen() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

Future<void> kembangApi(centerX, centerY, String colorSelect) async {
  clearScreen();

  // Frame 1: Kembang api naik (titik pusat sebelum ledak)
  printFrame1(centerX, centerY, colorSelect);
  await main.delay(500); // Delay 500 milidetik

  // Frame 2: Kembang api mulai meledak
  clearScreen();
  printFrame2(centerX, centerY, colorSelect);
  await main.delay(500);

  // Frame 3: Ledakan penuh
  clearScreen();
  printFrame3(centerX, centerY, colorSelect);
  await main.delay(500);
}