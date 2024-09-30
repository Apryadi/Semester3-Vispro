// Base class for Animal
abstract class Animal {
  // Abstract method to be implemented by subclasses
  void sound();

  // Method to represent eating behavior
  void eat() {
    print("${this.runtimeType} is eating.");
  }
}

// Class for Dog, extends Animal
class Dog extends Animal {
  @override
  void sound() {
    print("Woof! Woof!");
  }
}

// Class for Cat, extends Animal
class Cat extends Animal {
  @override
  void sound() {
    print("Meow! Meow!");
  }
}
