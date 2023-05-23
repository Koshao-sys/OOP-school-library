require_relative 'app'
require 'pry'

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

def main
  status = true
  app = App.new
  while status
    list_option
    option = gets.chomp.to_i
    if option == 1
      app.list_all_books
    elsif option == 2
      app.list_all_peoples
    else
      status = app.handel_option(option)
    end
  end
end

main
