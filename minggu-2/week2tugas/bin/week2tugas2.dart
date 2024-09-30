import 'dart:io';
import '../test/bank-info.dart';

// Subclass SavingsAccount that inherits from AkunBank
class SavingsAccount extends AkunBank {
  double interestRate;

  // Constructor to initialize balance and interest rate
  SavingsAccount(double balance, this.interestRate) : super(balance);

  // Method to apply interest
  void applyInterest() {
    double interest = checkBalance() * (interestRate / 100);
    deposit(interest);
    print('Interest applied: \$${interest}');
  }
}

void main() {
  // Get initial balance and interest rate from the user
  print('Enter initial balance:');
  double initialBalance = double.parse(stdin.readLineSync()!);

  print('Enter interest rate (in %):');
  double interestRate = double.parse(stdin.readLineSync()!);

  // Create a SavingsAccount object with user input for initial balance and interest rate
  SavingsAccount savingsAccount = SavingsAccount(initialBalance, interestRate);

  while (true) {
    // Display menu for user
    print('\nChoose an action:');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Apply Interest');
    print('4. Check Balance');
    print('5. Exit');

    // Get user's choice
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Deposit
        print('Enter deposit amount:');
        double depositAmount = double.parse(stdin.readLineSync()!);
        savingsAccount.deposit(depositAmount);
        break;
      case '2':
        // Withdraw
        print('Enter withdrawal amount:');
        double withdrawAmount = double.parse(stdin.readLineSync()!);
        savingsAccount.withdraw(withdrawAmount);
        break;
      case '3':
        // Apply interest
        savingsAccount.applyInterest();
        break;
      case '4':
        // Check balance
        print('Current Balance: \$${savingsAccount.checkBalance()}');
        break;
      case '5':
        // Exit the loop
        print('Goodbye!');
        return;
      default:
        print('Invalid option, please try again.');
    }
  }
}