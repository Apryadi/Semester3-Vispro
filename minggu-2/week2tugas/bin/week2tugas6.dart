import '../test/temperatur-info.dart';
import 'dart:io';

void main() {
  TemperatureConverter converter = TemperatureConverter();

  // Prompt the user to enter the temperature in Celsius
  print("Enter the temperature in Celsius:");
  double celsius = double.parse(stdin.readLineSync()!);

  // Display conversion options
  print("Choose the conversion option:");
  print("1. Convert to Reaumur");
  print("2. Convert to Fahrenheit");
  print("3. Convert to Kelvin");

  // Get user choice
  int choice = int.parse(stdin.readLineSync()!);

  // Perform the conversion based on user choice
  performConversion(choice, celsius, converter);
}

// Function to perform the conversion based on user choice
void performConversion(int choice, double celsius, TemperatureConverter converter) {
  switch (choice) {
    case 1:
      double reaumur = converter.toReaumur(celsius);
      print("$celsius °C is equal to ${reaumur.toStringAsFixed(2)} °Re");
      break;
    case 2:
      double fahrenheit = converter.toFahrenheit(celsius);
      print("$celsius °C is equal to ${fahrenheit.toStringAsFixed(2)} °F");
      break;
    case 3:
      double kelvin = converter.toKelvin(celsius);
      print("$celsius °C is equal to ${kelvin.toStringAsFixed(2)} K");
      break;
    default:
      print("Invalid option. Please choose 1, 2, or 3.");
      break;
  }
}
