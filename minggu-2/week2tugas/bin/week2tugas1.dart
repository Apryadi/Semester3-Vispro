import 'dart:io';
import '../test/student-info.dart';

void main() {
  print("Masukkan Nama Anda : ");
  String? nama = stdin.readLineSync();
  
  print("Masukkan ID anda : ");
  int studentID = int.parse(stdin.readLineSync()!);
  
  print("Masukkan Nilai Anda : ");
  int grade = int.parse(stdin.readLineSync()!);

  Student student1 = Student(nama!, studentID, grade);

  // Menampilkan informasi siswa
  print("Data Anda ${student1.toString()}");

  // Memeriksa jika Lulus/tidak
  if (grade >= 70) {
    print("Omedetou, Anda Lulus");
  } else {
    print("Anda gagal, Good luck next time :>");
  }
}
