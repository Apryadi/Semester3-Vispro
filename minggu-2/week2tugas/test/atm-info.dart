class ATM {
  // Private field to store the balance
  double _balance = 0.0;

  // Method to deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: \$${amount.toStringAsFixed(2)}");
    } else {
      print("Deposit amount must be positive.");
    }
  }

  // Method to withdraw money
  void withdraw(double amount) {
    if (amount > 0) {
      if (amount <= _balance) {
        _balance -= amount;
        print("Withdrew: \$${amount.toStringAsFixed(2)}");
      } else {
        print("Insufficient balance.");
      }
    } else {
      print("Withdrawal amount must be positive.");
    }
  }

  // Method to check the balance
  void checkBalance() {
    print("Current balance: \$${_balance.toStringAsFixed(2)}");
  }
}
