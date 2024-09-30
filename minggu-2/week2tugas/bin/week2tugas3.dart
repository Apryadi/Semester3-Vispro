import '../test/atm-info.dart';

void main() {
  // Create an instance of the ATM class
  ATM atm = ATM();

  // Performing operations
  performATMOperations(atm);
}

// Function to perform various ATM operations
void performATMOperations(ATM atm) {
  atm.deposit(100);      // Deposits $100
  atm.checkBalance();    // Checks balance: $100.00
  atm.withdraw(30);      // Withdraws $30
  atm.checkBalance();    // Checks balance: $70.00
  atm.withdraw(100);     // Attempts to withdraw $100, should show insufficient balance
}
