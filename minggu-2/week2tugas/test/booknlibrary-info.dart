// Class representing a book
class Book {
  String title;
  String author;
  int year;

  // Constructor for the Book class
  Book(this.title, this.author, this.year);
}

// Class representing a library
class Library {
  // List to hold the books
  List<Book> _books = [];

  // Method to add a book to the library
  void addBook(Book book) {
    _books.add(book);
    print("Added: '${book.title}' by ${book.author} (${book.year})");
  }

  // Method to remove a book from the library by title
  void removeBook(String title) {
    _books.removeWhere((book) => book.title == title);
    print("Removed: '$title' from the library");
  }

  // Method to display all books in the library
  void displayBooks() {
    if (_books.isEmpty) {
      print("No books in the library.");
    } else {
      print("Books in the library:");
      for (var book in _books) {
        print(" - '${book.title}' by ${book.author} (${book.year})");
      }
    }
  }
}
