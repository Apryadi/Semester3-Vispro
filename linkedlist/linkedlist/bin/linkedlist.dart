import 'dart:io'; // Import library untuk input/output
import 'dart:async';

class Node {
  String? data; // Data yang disimpan dalam node, nullable untuk keamanan jika tidak ada data
  Node? next; // Pointer ke node berikutnya, juga nullable

  Node(this.data); // Constructor untuk inisialisasi node dengan data
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
}

// Fungsi untuk memasukkan node baru ke posisi tertentu
Node insertNodeAtPosition(Node head, Node newNode, int position) {
  // Jika posisi yang dimasukkan adalah pertama (head), update newNode menjadi head
  if (position == 1) {
    newNode.next = head;
    return newNode;
  }

  // Mulai dari head untuk mencari posisi yang diinginkan
  Node? currentNode = head;
  int i = 1;
  if (position != 0) {
    while (currentNode!.next != null && i < position - 1) {
      currentNode = currentNode.next; // Traverse ke posisi sebelumnya
      i++;
    }
  } else {
    while (currentNode!.next != null) {
      currentNode = currentNode.next; // Traverse ke posisi sebelumnya
      i++;
    }
  }

  // Sisipkan node baru di posisi yang ditarget
  newNode.next = currentNode.next;
  currentNode.next = newNode;

  return head; // Mengembalikan head yang baru
}

// Fungsi untuk membentuk Linked List berdasarkan input dari pengguna
Node craft(String userInput) {
  Node head = Node(userInput[0]);
  for (int i = 1; i < userInput.length; i++) {
    insertNodeAtPosition(head, Node(userInput[i]), 0);
  }
  activateLoop(head);
  return head;
}

// Fungsi untuk menciptakan loop pada akhir linked list, agar terus berulang
Node activateLoop(Node head) {
  Node? currentNode = head;
  while (currentNode!.next != null) {
    currentNode = currentNode.next;
  }
  currentNode.next = head;
  return head;
}

Node? getNext(Node node) {
  return node.next;
}

// Fungsi untuk merotasi warna teks
String getColor(int row) {
  List<String> colors = ['\x1B[31m', '\x1B[32m', '\x1B[33m', '\x1B[34m'];
  return colors[(row - 20) % colors.length]; // Ganti warna setiap baris setelah 20
}

void main() async {
  // Meminta input dari user untuk menggantikan "GILBERT"
  stdout.write("Masukkan nama Anda: ");
  String? userName = stdin.readLineSync();

  // Memastikan nama pengguna tidak null atau kosong
  if (userName == null || userName.isEmpty) {
    print("Nama tidak boleh kosong!");
    return;
  }

  // Membuat linked list berdasarkan nama pengguna
  Node head = craft(userName);
  clearScreen();
  Node? node = null;

  int maxRows = 20; // Batas maksimal baris
  int screenWidth = getScreenSize()[0]; // Lebar layar terminal

  // Loop untuk menampilkan output di terminal hingga maksimal 20 baris
  for (int j = 1; j <= getScreenSize()[1]; j++) {
    if (node == null) {
      node = head;
    }

    // Cek apakah baris sudah melewati batas 20
    if (j > maxRows) {
      stdout.write(getColor(j)); // Ubah warna jika baris lebih dari 20
    }

    if (j % 2 != 0) {
      for (int i = 1; i <= screenWidth; i++) {
        moveTo(j, i);
        stdout.write(node!.data);
        node = getNext(node)!;
        await delay(10);
      }
    } else {
      for (int i = screenWidth; i > 0; i--) {
        moveTo(j, i);
        stdout.write(node!.data);
        node = getNext(node)!;
        await delay(10);
      }
    }

    // Reset warna ke default setelah selesai menulis satu baris
    stdout.write('\x1B[0m');
  }
}
