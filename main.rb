require_relative 'app'

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

  def create_person_input(option)
    puts 'age:-'
    age = gets.chomp.to_i
    puts 'name:-'
    name = gets.chomp
    parent_permission = check_permission
    create_person(option, age, name, parent_permission)
  end

  def create_person(option, age, name, parent_permission)
    case option.to_i
    when 1
      @app.create_student(age, name, parent_permission)
    when 2
      create_teacher(age, name, parent_permission)
    else
      puts 'Invalid input ):'
    end
  end

  def create_teacher(age, name, parent_permission)
    puts 'specialization:-'
    specialization = gets.chomp
    @app.create_teacher(age, specialization, name, parent_permission)
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

  def data
    @app.load_data
  end

  def handle_writing_and_exit
    @app.handle_writing
  end

  def handle_option(option)
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_peoples
    when 3
      create_person_menu
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_person_rentals
    end
  end

  def create_person_menu
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:-'
    option = gets.chomp
    create_person_input(option)
  end
end

def main
  main = Main.new
  puts 'Welcome to School Library App!'
  main.data
  loop do
    main.list_option
    option = gets.chomp.to_i
    if option < 1 || option > 7
      puts 'Invalid number :('
    elsif option == 7
      main.handle_writing_and_exit
      exit
    else
      main.handle_option(option)
    end
  end
end

main
