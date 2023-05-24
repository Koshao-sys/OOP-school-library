require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require 'json'

class App
  def initialize
    @books = []
    @peoples = []
  end

 def write_file(data,path)
    if File.exist?(path)
      file = File.open(path, 'a')
      file.puts(data.to_json)
      file.close
    else
      file = File.open(path, 'w')
      file.puts(data.to_json)
      file.close
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

  def create_teacher(age, specialization, name, parent_permission)
    @peoples << Teacher.new(age, specialization, name: name, parent_permission: parent_permission)
    teacher_data = {
      'age' => age, 
      'specialization' => specialization, 
      'name' => name,
      'permission' => parent_permission,
    }
    path = './data/parent.json'
    write_file(teacher_data,path)
  end

  def create_student(age, name, parent_permission)
    @peoples << Student.new(age, name: name, parent_permission: parent_permission)
    student_data = {
      'age' => age, 
      'name' => name, 
      'permission' => parent_permission,
    }

    path = './data/student.json'
    write_file(student_data,path)
    
  end

  def create_book
    puts 'Title:-'
    title = gets.chomp
    puts 'Author:-'
    author = gets.chomp
    @books << Book.new(title, author)
    book_data = {
      'title' => title, 
      'author' => author, 
    }
    path = './data/book.json'
    write_file(book_data,path)
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
    rental_data = {
      'date' => date, 
      'books' => {
        'title' => @books[book_index].title,
        'author' => @books[book_index].author,
      },
      'people' => {
        'name' => @peoples[person_index].name,
        'id' => @peoples[person_index].id,
        'age' => @peoples[person_index].age,
      },
    }
    path = './data/rental.json'
    write_file(rental_data,path)
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
