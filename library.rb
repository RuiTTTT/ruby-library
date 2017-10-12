# the Library class is used to store the details of the books condition
class Library
  attr_accessor :borrowed_array, :available_array

  def initialize(borrowed, available)
    @borrowed_array, @available_array = borrowed, available
  end

  # this method returns the book that is available to be borrowed
  def get_available
    @available_array
  end

  # this method update after a borrow operation by moving the book id from available list to borrowed list
  def borrow_update(id)
    @available_array.delete(id)
    @borrowed_array.push(id)
  end

  # this method update after a return operation by moving the book id from borrowed list to available list
  def return_update(id)
    @available_array.push(id)
    @borrowed_array.delete(id)
  end

end