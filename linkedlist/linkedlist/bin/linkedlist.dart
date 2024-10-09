import 'dart:io'; // Import library untuk input/output
import 'dart:async';
import 'dart:math'; // Untuk fungsi random pada warna

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

List<int> getScreenSize() {
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

  Node? currentNode = head;
  int i = 1;
  if (position != 0) {
    while (currentNode!.next != null && i < position - 1) {
      currentNode = currentNode.next;
      i++;
    }
  } else {
    while (currentNode!.next != null) {
      currentNode = currentNode.next;
      i++;
    }
  }

  newNode.next = currentNode.next;
  currentNode.next = newNode;

  return head; // Mengembalikan head yang baru
}

// Fungsi untuk menciptakan loop pada akhir linked list
Node activateLoop(Node head) {
  Node? currentNode = head;
  while (currentNode!.next != null) {
    currentNode = currentNode.next;
  }
  currentNode.next = head;
  return head;
}

// Fungsi untuk mendapatkan warna acak
String getRandomColor(String currentColor) {
  const String RESET = '\x1B[0m';
  const String RED = '\x1B[31m';
  const String GREEN = '\x1B[32m';
  const String YELLOW = '\x1B[33m';
  const String BLUE = '\x1B[34m';
  const String MAGENTA = '\x1B[35m';
  const String CYAN = '\x1B[36m';

  const List<String> colors = [RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN];
  Random random = Random();
  String newColor;

  do {
    newColor = colors[random.nextInt(colors.length)];
  } while (newColor == currentColor); // Memastikan warna baru berbeda dengan warna sebelumnya

  return newColor;
}

// Fungsi untuk membuat linked list dari inputan pengguna
Node craft(String userInput) {
  Node head = Node(userInput[0]);
  for (int i = 1; i < userInput.length; i++) {
    insertNodeAtPosition(head, Node(userInput[i]), 0);
  }
  activateLoop(head);
  return head;
}

Node? getNext(Node node) {
  return node.next;
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

  Node head = craft(userName);
  clearScreen();
  String selectedColor = '\x1B[0m'; // Inisialisasi dengan warna default

  // Infinite loop untuk mengubah warna teks dan merefresh tampilan
  while (true) {
    Node? node = null;
    selectedColor = getRandomColor(selectedColor); // Update warna pada setiap iterasi
    stdout.write(selectedColor); // Terapkan warna pada output terminal

    // Loop untuk menampilkan linked list di terminal
    for (int j = 1; j <= getScreenSize()[1]; j++) {
      if (node == null) {
        node = head;
      }

      if (j % 2 != 0) {
        for (int i = 1; i <= getScreenSize()[0]; i++) {
          moveTo(j, i);
          stdout.write(node!.data);
          node = getNext(node)!;
          await delay(10);
        }
      } else {
        for (int i = getScreenSize()[0]; i > 0; i--) {
          moveTo(j, i);
          stdout.write(node!.data);
          node = getNext(node)!;
          await delay(10);
        }
      }
    }

    // Reset warna setelah setiap refresh layar
    stdout.write('\x1B[0m');
  }
}
