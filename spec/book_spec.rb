require_relative '../book'

RSpec.describe Book do
  describe '#add_rental' do
    it 'adds a rental to the book' do
      book = Book.new('Dark throne', 'Kevin Ocean')
      person = double('person')
      date = '2023-05-24'
      expect(Rental).to receive(:new).with(book, person, date)
      book.add_rental(person, date)
      expect(book.rentals).not_to be_empty
    end
  end
end
