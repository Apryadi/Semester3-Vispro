import 'dart:io';
import 'dart:async';

// ASCII art for letters H, B, D, A, N, O
final Map<String, List<String>> asciiLetters = {
  'H': [
    'H   H',
    'H   H',
    'HHHHH',
    'H   H',
    'H   H',
  ],
  'B': [
    'BBBB ',
    'B   B',
    'BBBB ',
    'B   B',
    'BBBB ',
  ],
  'D': [
    'DDDD ',
    'D   D',
    'D   D',
    'D   D',
    'DDDD ',
  ],
  'A': [
    '  A  ',
    ' A A ',
    'AAAAA',
    'A   A',
    'A   A',
  ],
  'N': [
    'N   N',
    'NN  N',
    'N N N',
    'N  NN',
    'N   N',
  ],
  'O': [
    ' OOO ',
    'O   O',
    'O   O',
    'O   O',
    ' OOO ',
  ]
};

// Function to clear the screen
void clearScreen() {
  stdout.write('\x1b[2J\x1b[H');
}

// Function to move the cursor to a specific position
void moveCursor(int x, int y) {
  stdout.write('\x1b[${y};${x}H');
}

// Function to display repeated ASCII letters centered and with animation from bottom to top
Future<void> animateAsciiArt(String text) async {
  List<String> lines = List.filled(5, ''); // Create 5 empty lines for ASCII art rows
  
  // Prepare ASCII art for each letter
  for (var char in text.split('')) {
    if (asciiLetters.containsKey(char)) {
      List<String> asciiLetter = asciiLetters[char]!;
      for (int i = 0; i < asciiLetter.length; i++) {
        lines[i] += asciiLetter[i] + ' '; // Add letter to each line with spacing
      }
    }
  }

  // Get terminal size
  int height = stdout.terminalLines; // Current terminal height
  int width = stdout.terminalColumns; // Current terminal width
  
  // Calculate starting row (from below the terminal)
  int startRow = height + 5;
  // Calculate target row to place the text at the middle of the screen
  int targetRow = (height ~/ 2) - (lines.length ~/ 2);

  // Animate moving from bottom to middle
  for (int row = startRow; row > targetRow; row--) {
    clearScreen();
    for (int i = 0; i < lines.length; i++) {
      // Center the text horizontally
      int centerX = (width ~/ 2) - (lines[i].length ~/ 2);
      moveCursor(centerX, row + i); // Move cursor to center
      stdout.writeln(lines[i]); // Write each line of ASCII art
    }
    await Future.delayed(Duration(milliseconds: 100)); // Delay between frames
  }
}

void main() async {
  String message = "HBD ANO";
  
  // Start the animation for displaying ASCII art
  await animateAsciiArt(message);
}
