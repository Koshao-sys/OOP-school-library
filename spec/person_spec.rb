require_relative '../person'
require_relative '../book'

RSpec.describe Person do
  let(:book) { Book.new('Game of Thrones', 'George R. R. Martin') }

  describe '#initialize' do
    it 'creates a new person' do
      person = Person.new(25, name: 'John Doe', parent_permission: true)

      expect(person.age).to eq(25)
      expect(person.name).to eq('John Doe')
      expect(person.instance_variable_get(:@parent_permission)).to be true
      expect(person.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental for the person' do
      person = Person.new(25, name: 'John Doe', parent_permission: true)
      date = '12-03-1990'
      rental = person.add_rental(book, date)

      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)

      expect(person.rentals).to include(rental)
      expect(book.rentals).to include(rental)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(25, name: 'John Doe', parent_permission: true)

      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person can use services' do
      person_of_age = Person.new(25, name: 'John Doe', parent_permission: true)
      person_with_permission = Person.new(15, name: 'Jane Smith', parent_permission: true)
      person_without_permission = Person.new(17, name: 'Tom Johnson', parent_permission: false)

      expect(person_of_age.can_use_services?).to be true
      expect(person_with_permission.can_use_services?).to be true
      expect(person_without_permission.can_use_services?).to be false
    end
  end
end
