# this is the top level file
require_relative 'book'
require_relative 'user'
require_relative 'library'

# this is the borrow method, need to input the user,book and library object as parameters
def borrow_book(user, book, library)
  book_id = book.get_id
  if library.get_available.include?(book_id) == false     # check if this book is available
  then
    puts("Sorry! Book #{book.title} Is Already Borrowed!") # failed notice
  else
    library.borrow_update(book_id)     # successful borrow update the list of library
    user.borrow_update(book_id)        # successful borrow update the list of user
    puts("Successfully Borrowed Book #{book.title}!")       # success notice
  end
end

# this is the return method, need to input the user,book and library object as parameters
def return_book(user, book, library)
  book_id = book.get_id
  borrow_list = user.get_blist
  if borrow_list.include?(book_id) == true    # check if the book is borrowed by the user and can be returned
  then
    library.return_update(book_id)    # update the lists of library
    user.return_update(book_id)       # update the lists of user
    puts("Successfully Returned Book #{book.title}!")               # success notice
  else
    puts("Return Failure! Haven't Borrowed Book #{book.title}!")  # failed notice if the user haven't borrowed this book
  end
end

# the method is used to print out the available list of books, the book_array parameter contains all the book objects.
def book_available(book_array, library)
  available_list = library.get_available
  book_array.each do |book|              # checking if the book id is in the available list
    if available_list.include?(book.id)
    then
      puts("Book #{book.title} is available")
    end
  end
end

# the five instances of book
book1 = Book.new('A', 'Homer', 100, 2009, 600, 1)
book2 = Book.new('B', 'Marge', 101, 2012, 200, 3)
book3 = Book.new('C', 'Bart', 102, 2016, 500, 1)
book4 = Book.new('D', 'Lisa', 103, 2003, 700, 5)
book5 = Book.new('E', 'Maggie', 104, 2015, 400, 2)

# the book array used to check available books
book_array = [book1, book2, book3, book4, book5]

# the two instances of user, the borrow list is empty now
user1 = User.new('Tom', 'Dublin2', 10, Array.new)
user2 = User.new('Jerry', 'Dublin4', 20, Array.new)

# the library instance, the borrow list is empty and the available list contains all the book ids
library = Library.new(Array.new, [100, 101, 102, 103, 104])

# these are the test cases for this program
book_available(book_array,library)               # get the available book list now
puts user1.borrow_list                           # print the borrow list of user1, now is empty
borrow_book(user1, book1, library)  # user1 do a borrow event to borrow book1
puts user1.borrow_list                           # print the borrow list of user1, there should be the book id just borrowed
book_available(book_array,library)               # get the available book list now
borrow_book(user2, book1, library)  # user2 trying to borrow book1 which is already borrowed by another user
return_book(user1, book1, library)  # user1 return book1
book_available(book_array,library)               # get the available book list now
borrow_book(user2, book1, library)  # user2 trying to borrow book1 again, it should be a success borrow
return_book(user2, book5, library)  # user2 return book5 which he hasn't borrowed, will return failed notice