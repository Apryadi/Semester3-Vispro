import '../test/kendaraan-info.dart';
import 'dart:io';

void main() {
  // Prompt user for input and handle vehicle creation
  Vehicle? vehicle = createVehicle();

  // Call the move method for the created vehicle
  if (vehicle != null) {
    vehicle.move();
  } else {
    print("Invalid vehicle type selected.");
  }
}

// Function to create a vehicle based on user input
Vehicle? createVehicle() {
  print("Enter the type of vehicle (Car or Bike):");
  String type = stdin.readLineSync()!.toLowerCase();

  print("Enter the name of the vehicle:");
  String name = stdin.readLineSync()!;

  print("Enter the speed of the vehicle (km/h):");
  double speed = double.parse(stdin.readLineSync()!);

  if (type == "car") {
    return Car(name, speed);
  } else if (type == "bike") {
    return Bike(name, speed);
  } else {
    return null;
  }
}
