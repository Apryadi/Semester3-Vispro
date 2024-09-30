class Student {
  String nama;
  int studentID;
  int grade;

  Student(this.nama, this.studentID, this.grade); 

    @override
  String toString() {
    return 'Nama: $nama, ID: $studentID, Nilai: $grade';
  }
}