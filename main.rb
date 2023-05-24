require_relative 'app'
require 'pry'

class Main
  def initialize
    @app = App.new
  end

  def list_option
    puts ''
    puts '1 - List all books.'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def create_person(option, age, name, parent_permission)
    case option.to_i
    when 1
      @app.create_student(age, name, parent_permission)
    when 2
      puts 'specialization:-'
      specialization = gets.chomp
      @app.create_teacher(age, specialization, name, parent_permission)
    else
      puts 'Invalid input ):'
    end
  end

  def check_permission
    puts 'Has parent permission?[Y/N]'
    val = gets.chomp.upcase
    case val
    when 'Y'
      true
    when 'N'
      false
    else
      puts 'Invalid selection, please type either Y or N to proceed'
      check_permission
    end
  end

  def create_person_input(option)
    puts 'age:-'
    age = gets.chomp.to_i
    puts 'name:-'
    name = gets.chomp
    parent_permission = check_permission
    create_person(option, age, name, parent_permission)
  end

  def handel_option(option)
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_peoples
    when 3
      puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:-'
      option = gets.chomp
      create_person_input(option)
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      puts 'Enter person ID:-'
      id = gets.chomp.to_i
      @app.list_person_rentals(id)
    end
  end
end

def main
  main = Main.new
  puts 'Welcome to School Library App!'
  loop do
    main.list_option
    option = gets.chomp.to_i
    break if option == 7

    puts 'Invalid number :(' if option < 1 || option > 7
    main.handel_option(option)
  end
end

main
