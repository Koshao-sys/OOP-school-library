require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @peoples = []
  end

  def list_all_books
    @books.each { |book| puts "Title:- #{book.title}   Author:- #{book.author} \n" }
  end

  def list_all_peoples
    @peoples.each do |people|
      puts "[#{people.class.name}] Name:- #{people.name} ID:- #{people.id} Age:- #{people.age} \n"
    end
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
    Rental.new(@books[book_index], @peoples[person_index], date)
  end

  def list_person_rentals(person_id)
    @peoples.each do |person|
      if person.id == person_id
        puts 'Rentals:-'
        person.rentals.each { |rental| puts "Date #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" }
      end
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:-'
    option = gets.chomp
    parent_permission = true
    puts 'age:-'
    age = gets.chomp.to_i
    puts 'name:-'
    name = gets.chomp
    puts 'Has parent permission?[Y/N]'
    val = gets.chomp
    parent_permission = false if %w[N n NO no No].include?(val)

    case option.to_i
    when 1
      create_student(age, name, parent_permission)
    when 2
      puts 'specialization:-'
      specialization = gets.chomp
      create_teacher(age, specialization, name, parent_permission)
    else
      puts 'Invalid input ):'
    end
  end

  def handel_option(option)
    case option
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      puts 'Enter person ID:-'
      id = gets.chomp.to_i
      list_person_rentals(id)
    when 7
      puts 'Thanks :)...............'
      return false
    else
      puts 'Invalid number :('
    end
    true
  end
end
