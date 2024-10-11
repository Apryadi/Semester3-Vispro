import 'dart:io';
import 'dart:async';
import 'dart:math';

void main() {
  final game = KadalGame();
  game.start();
}

class Point {
  int x, y;
  Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);

  Point clone() => Point(x, y);
}

enum Direction { up, right, down, left }

class KadalGame {
  static const int width = 20;
  static const int height = 10;
  static const Duration gameSpeed = Duration(milliseconds: 200);

  List<Point> kadal = [];
  late Point food;
  int score = 0;
  int highScore = 0;
  Direction currentDirection = Direction.right;
  final Random random = Random();

  KadalGame() {
    kadal.add(Point(width ~/ 2, height ~/ 2));
    generateFood();
  }

  void generateFood() {
    bool validPosition = false;
    while (!validPosition) {
      food = Point(random.nextInt(width), random.nextInt(height));
      validPosition = !kadal.any((segment) => segment.x == food.x && segment.y == food.y);
    }
  }

  bool isOppositeDirection(Direction dir1, Direction dir2) {
    return (dir1 == Direction.up && dir2 == Direction.down) ||
           (dir1 == Direction.down && dir2 == Direction.up) ||
           (dir1 == Direction.left && dir2 == Direction.right) ||
           (dir1 == Direction.right && dir2 == Direction.left);
  }

  List<Point> getValidMoves(Point head) {
    List<Point> possibleMoves = [];
    List<Direction> directions = Direction.values;
    
    for (var direction in directions) {
      // Skip opposite direction to prevent backward movement
      if (isOppositeDirection(direction, currentDirection)) continue;

      Point nextPos;
      switch (direction) {
        case Direction.up:
          nextPos = Point(head.x, (head.y - 1 + height) % height);
          break;
        case Direction.right:
          nextPos = Point((head.x + 1) % width, head.y);
          break;
        case Direction.down:
          nextPos = Point(head.x, (head.y + 1) % height);
          break;
        case Direction.left:
          nextPos = Point((head.x - 1 + width) % width, head.y);
          break;
      }

      // Check if move would result in collision with body
      bool willCollide = kadal.any((segment) => 
        segment.x == nextPos.x && segment.y == nextPos.y);

      if (!willCollide) {
        possibleMoves.add(nextPos);
      }
    }

    return possibleMoves;
  }

  int calculateDistance(Point p1, Point p2) {
    // Calculate Manhattan distance considering wrap-around
    int dx = (p1.x - p2.x).abs();
    int dy = (p1.y - p2.y).abs();
    
    // Consider wrap-around distances
    dx = min(dx, width - dx);
    dy = min(dy, height - dy);
    
    return dx + dy;
  }

  Direction getDirectionFromPoints(Point current, Point next) {
    if (next.y == (current.y - 1 + height) % height) return Direction.up;
    if (next.y == (current.y + 1) % height) return Direction.down;
    if (next.x == (current.x + 1) % width) return Direction.right;
    return Direction.left;
  }

  Point chooseNextMove() {
    final head = kadal.first;
    List<Point> validMoves = getValidMoves(head);

    if (validMoves.isEmpty) {
      // Jika tidak ada gerakan valid, coba kurangi panjang kadal
      if (kadal.length > 1) {
        kadal.removeLast();
        validMoves = getValidMoves(head);
      }
      // Jika masih tidak ada gerakan valid, kembalikan posisi saat ini
      if (validMoves.isEmpty) return head;
    }

    // Sortir gerakan berdasarkan jarak ke makanan
    validMoves.sort((a, b) {
      int distA = calculateDistance(a, food);
      int distB = calculateDistance(b, food);
      return distA.compareTo(distB);
    });

    // Pilih gerakan yang mendekat ke makanan jika aman
    for (var move in validMoves) {
      Direction newDir = getDirectionFromPoints(head, move);
      
      // Simulasi gerakan untuk memeriksa apakah akan terjebak
      List<Point> simulatedKadal = List.from(kadal);
      simulatedKadal.insert(0, move);
      simulatedKadal.removeLast();
      
      Point simulatedHead = move;
      List<Point> futureValidMoves = [];
      
      // Periksa gerakan yang mungkin setelah gerakan ini
      for (var dir in Direction.values) {
        if (isOppositeDirection(dir, newDir)) continue;
        
        Point futurePos;
        switch (dir) {
          case Direction.up:
            futurePos = Point(simulatedHead.x, (simulatedHead.y - 1 + height) % height);
            break;
          case Direction.right:
            futurePos = Point((simulatedHead.x + 1) % width, simulatedHead.y);
            break;
          case Direction.down:
            futurePos = Point(simulatedHead.x, (simulatedHead.y + 1) % height);
            break;
          case Direction.left:
            futurePos = Point((simulatedHead.x - 1 + width) % width, simulatedHead.y);
            break;
        }
        
        if (!simulatedKadal.any((segment) => 
          segment.x == futurePos.x && segment.y == futurePos.y)) {
          futureValidMoves.add(futurePos);
        }
      }
      
      // Jika ada setidaknya satu gerakan valid setelah ini, pilih gerakan ini
      if (futureValidMoves.isNotEmpty) {
        currentDirection = newDir;
        return move;
      }
    }

    // Jika tidak ada gerakan yang ideal, pilih gerakan pertama yang valid
    if (validMoves.isNotEmpty) {
      currentDirection = getDirectionFromPoints(head, validMoves[0]);
      return validMoves[0];
    }

    return head;
  }

  void moveKadal() {
    Point nextPosition = chooseNextMove();

    // Cek apakah memakan makanan
    if (nextPosition.x == food.x && nextPosition.y == food.y) {
      kadal.insert(0, nextPosition);
      score += 10;
      generateFood();
    } else {
      kadal.insert(0, nextPosition);
      kadal.removeLast();
    }

    if (score > highScore) {
      highScore = score;
    }
  }

  void drawGame() {
    print('\x1B[2J\x1B[0;0H'); // Clear screen
    // print('Score: $score   High Score: $highScore');
    // print('Panjang Kadal: ${kadal.length}\n');

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final point = Point(x, y);
        if (kadal.any((segment) => segment.x == x && segment.y == y)) {
          if (point == kadal.first) {
            stdout.write(':3'); // Kepala kadal
          } else {
            // Tambahkan kaki di sekitar badan
            Point leftLeg = Point(point.x - 1, point.y);  // Kaki kiri
            Point rightLeg = Point(point.x + 1, point.y); // Kaki kanan
            if (kadal.contains(leftLeg) || kadal.contains(rightLeg)) {
              stdout.write('o'); // Badan kadal tanpa kaki
            } else if (point == kadal[kadal.length - 1]) {
              stdout.write('o'); // Bagian ekor
            } else {
              stdout.write('o'); // Badan kadal
            }
          }
        } else if (food.x == x && food.y == y) {
          stdout.write('*'); // Makanan
        } else {
          stdout.write('.'); // Ruang kosong
        }
      }
      print(''); // New line
    }
    print('\nKontrol: Game berjalan otomatis');
    print('Tekan Ctrl+C untuk keluar');
  }

  Future<void> start() async {
    while (true) {
      drawGame();
      moveKadal();
      await Future.delayed(gameSpeed);
    }
  }
}
