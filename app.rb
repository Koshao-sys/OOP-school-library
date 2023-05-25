require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'write_files'
require 'json'

class App
  def initialize
    @books = []
    @peoples = []
    @rentals = []
    @writer = Writer.new
    @peoples_path = './data/peoples.json'
    @rentals_path = './data/rentals.json'
    @books_path = './data/books.json'
  end

  def handle_writing
    puts 'Writing data and preparing exit...'
    write_peoples
    write_books
    write_rentals
  end

  def read_people(json_data)
    json_data.each_line do |line|
      data = JSON.parse(line)
      if line.include?('specialization')
        teacher = Teacher.new(data['age'], data['specialization'], name: data['name'], parent_permission: true)
        @peoples << teacher
      else
        student = Student.new(data['age'], name: data['name'], parent_permission: data[parent_permission])
        @peoples << student
      end
    end
  end

  def read_books(json_data)
    json_data.each_line do |line|
      data = JSON.parse(line)
      book = Book.new(data['title'], data['author'])
      @books << book
    end
  end

  def read_rentals(json_data)
    json_data.each_line do |line|
      data = JSON.parse(line)
      rental = Book.new(data['title'], data['author'])
      @rentals << rental
    end
  end

  def load_data
    if File.exist?(@peoples_path)
      File.open(@peoples_path, 'r') do |file|
        people_data = file.read
        read_people(people_data)
      end
    end
    if File.exist?(@books_path)
      File.open(@books_path, 'r') do |file|
        books_data = file.read
        read_books(books_data)
      end
    end
    return unless File.exist?(@rentals_path)

    File.open(@rentals_path, 'r') do |file|
      rentals_data = file.read
      read_rentals(rentals_data)
    end
  end

  def list_all_books
    @books.each { |book| puts "Title:- #{book.title}   Author:- #{book.author} \n" }
  end

  def list_all_peoples
    @peoples.each do |people|
      puts "[#{people.class.name}] Name:- #{people.name} ID:- #{people.id} Age:- #{people.age} \n"
    end
  end

  def write_books
    @writer.book_writer(@books, @books_path)
  end

  def write_rentals
    @writer.rentals_writer(@rentals, @rentals_path)
  end

  def write_peoples
    @writer.people_writer(@peoples, @peoples_path)
  end

  def create_teacher(age, specialization, name, parent_permission)
    @peoples << Teacher.new(age, specialization, name: name, parent_permission: parent_permission)
  end

  def create_student(age, name, parent_permission)
    @peoples << Student.new(age, name: name, parent_permission: parent_permission)
  end

  def create_book
    puts 'Title:-'
    title = gets.chomp
    puts 'Author:-'
    author = gets.chomp
    @books << Book.new(title, author)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each.with_index { |book, idx| puts "#{idx}) Book #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    @peoples.each.with_index do |person, idx|
      puts "#{idx}) [#{person.class.name}] Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:- e.g dd-mm-yyyy'
    date = gets.chomp
    @rentals << Rental.new(@books[book_index], @peoples[person_index], date)
  end

  def list_person_rentals(person_id)
    @peoples.each do |person|
      if person.id == person_id
        puts 'Rentals:-'
        person.rentals.each { |rental| puts "Date #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" }
      end
    end
  end
end
