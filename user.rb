# the User class is used to store details of user
class User
  attr_accessor :name, :address, :id, :borrow_list

  def initialize(name, address, id, borrow_list)
    @name, @address, @id, @borrow_list = name, address, id, borrow_list
  end

  # this method returns the list of book id the user has borrowed
  def get_blist
    @borrow_list
  end

  # update the borrow list with insertion of newly borrowed book id after a success borrow operation
  def borrow_update(id)
    @borrow_list.push(id)
  end

  # update the borrow list with deletion of newly borrowed book id after a success return operation
  def return_update(id)
    @borrow_list.delete(id)
  end
end