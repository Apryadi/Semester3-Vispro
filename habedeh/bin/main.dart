import 'apalah.dart' as warna;
import 'habedeh.dart' as fireworks;
import 'pakano.dart' as tulisan; // Import pakano.dart
import 'dart:async';
import 'dart:math';
import 'dart:io'; 

getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

void printCoords(String text, int width, int height) {
  int screenHeight = getScreenSize()[1];

  // Hitung posisi horizontal (di tengah layar)
  int centerX = width;

  // Hitung posisi vertikal (di tengah layar)
  int centerY = screenHeight - height;

  // Pindahin kursor ke tengah layar
  stdout.write('\x1B[${centerY};${centerX}H');

  // Print teks
  stdout.write(text);

  // Reset posisi kursor ke bawah
  stdout.write('\x1B[${screenHeight};0H');
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

int randomMax(int max) {
  return Random().nextInt(max);
}

void main() async {
  clearScreen();
  String text = "|";
  stdout.write("Berapa banyak kembang api mau di buat ler? : ");
  int? jumlahKembangApi = (int.parse(stdin.readLineSync()!));
  jumlahKembangApi = jumlahKembangApi < 1 ? 1 : jumlahKembangApi;

  clearScreen();
  for (int j = 0; j < jumlahKembangApi; j++) {
    int minHeight = getScreenSize()[1] ~/ 3;
    int randomX = randomMax(getScreenSize()[0]);
    int randomY = random(minHeight, getScreenSize()[1] - minHeight);
    String randomwarna = warna.getRandomColor();
    if (j == 0) {
      randomX = getScreenSize()[0] ~/ 2;
      randomY = getScreenSize()[1] ~/ 2;
    }
    for (int i = 0; i < randomY; i++) {
      printCoords(randomwarna + text + warna.RESET, randomX, i);
      await delay(100);
      clearScreen();
    }
    await fireworks.kembangApi(randomX, randomY, randomwarna);
  }

  // Clear screen and call the animateAsciiArt from pakano.dart
  await tulisan.animateAsciiArt("HBD ANO"); // Memanggil fungsi dari pakano.dart
}
