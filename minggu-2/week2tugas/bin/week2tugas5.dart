import '../test/binatang-info.dart';

void main() {
  // Creating instances of Dog and Cat
  Animal dog = Dog();
  Animal cat = Cat();

  // Calling methods on Dog
  performAnimalOperations(dog);
  
  // Calling methods on Cat
  performAnimalOperations(cat);
}

// Function to perform operations on animals
void performAnimalOperations(Animal animal) {
  animal.sound(); // Outputs the sound of the animal
  animal.eat();   // Outputs the eating behavior of the animal
}
