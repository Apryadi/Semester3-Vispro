import 'dart:async';
import 'dart:io';

void main() async {
  String text = "Apryadi";
  int maxRows = 50;  // Jumlah baris maksimum
  int length = text.length;
  int terminalWidth = stdout.terminalColumns;
  int currentRow = 0;
  int currentIndex = 0; // Indeks huruf yang akan dicetak selanjutnya
  bool leftToRight = true; // Arah cetak, awalnya dari kiri ke kanan

  while (currentRow < maxRows) { // Batasi hingga 50 baris
    String line = ''; // Baris yang akan dicetak
    
    // Mengisi baris dengan karakter sesuai pola
    while (line.length < terminalWidth) {
      if (leftToRight) {
        // Cetak dari kiri ke kanan
        line += text[currentIndex] + ' ';
      } else {
        // Cetak dari kanan ke kiri
        line += text[length - currentIndex - 1] + ' ';
      }
      currentIndex++;  // Naikkan indeks ke huruf berikutnya
      
      // Jika sudah mencapai akhir string, kembali ke awal
      if (currentIndex >= length) {
        currentIndex = 0;
      }

      // Delay untuk setiap huruf (100 ms)
      await Future.delayed(Duration(milliseconds: 100));
      stdout.write(line[line.length - 2]); // Cetak huruf yang baru saja ditambahkan
    }

    // Cetak newline dan lanjut ke baris berikutnya
    print('');
    currentRow++;
    leftToRight = !leftToRight; // Ganti arah cetak untuk baris berikutnya
  }
}
