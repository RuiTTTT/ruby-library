# the Book class is used to store details of book
class Book
  attr_accessor :title, :author, :id, :date, :pages, :edition

  def initialize(title, author, id, date, pages, edition)
    @title, @author, @id, @date, @pages, @edition = title, author, id, date, pages, edition
  end

  #the get_id method is used to return the book id
  def get_id
    @id
  end
end