
import '../test/booknlibrary-info.dart';
void main() {
  Library library = Library();

  // Creating some book instances
  Book book1 = Book("1984", "George Orwell", 1949);
  Book book2 = Book("To Kill a Mockingbird", "Harper Lee", 1960);
  Book book3 = Book("The Great Gatsby", "F. Scott Fitzgerald", 1925);

  // Adding books to the library
  performLibraryOperations(library, [book1, book2, book3]);
}

// Function to perform library operations
void performLibraryOperations(Library library, List<Book> books) {
  for (var book in books) {
    library.addBook(book);
  }

  // Displaying all books in the library
  library.displayBooks();

  // Removing a book from the library
  library.removeBook("1984");

  // Displaying all books in the library again
  library.displayBooks();
}
