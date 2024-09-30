// Base class for Vehicle
class Vehicle {
  String name;
  double speed;

  // Constructor for Vehicle
  Vehicle(this.name, this.speed);

  // Abstract method to be overridden by subclasses
  void move() {}
}

// Subclass for Car, extends Vehicle
class Car extends Vehicle {
  Car(String name, double speed) : super(name, speed);

  @override
  void move() {
    print("The car '$name' moves fast on roads at $speed km/h.");
  }
}

// Subclass for Bike, extends Vehicle
class Bike extends Vehicle {
  Bike(String name, double speed) : super(name, speed);

  @override
  void move() {
    print("The bike '$name' moves swiftly through traffic at $speed km/h.");
  }
}
