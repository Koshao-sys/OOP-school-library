require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  let(:book) { Book.new('Game of Thrones', 'George R. R. Martin') }
  let(:person) { Person.new(25, name: 'John Doe', parent_permission: true) }
  date = '24-04-2023'

  describe '#initialize' do
    it 'sets the book, person, and date' do
      rental = Rental.new(book, person, date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
    end

    it 'adds the rental to the book' do
      rental = Rental.new(book, person, date)
      expect(book.rentals).to include(rental)
    end

    it 'adds the rental to the person' do
      rental = Rental.new(book, person, date)
      expect(person.rentals).to include(rental)
    end
  end
end
