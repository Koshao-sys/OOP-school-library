class Rental
  attr_accessor :name, :age, :books, :rentals

  def initialize(book, person, date)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end
