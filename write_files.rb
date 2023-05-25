require 'pry'

class Writer
  def booking(book, _path, file)
    data = {
      title: book.title,
      author: book.author
    }
    file.puts(data.to_json)
    file.close
  end

  def book_writer(books, path)
    file = if File.exist?(path)
             File.open(path, 'a')
           else
             File.open(path, 'w')
           end
    books.each do |book|
      booking(book, path, file) if book.is_a?(Book)
    end
  end

  def student(person, _path, file)
    data = {
      id: person.id,
      age: person.age,
      name: person.name,
      parent_permission: person.instance_variable_get(:@parent_permission)
    }
    file.puts(data.to_json)
    file.close
  end

  def teacher(person, _path, file)
    data = {
      id: person.id,
      age: person.age,
      name: person.name,
      specialization: person.instance_variable_get(:@specialization),
      parent_permission: person.instance_variable_get(:@parent_permission)
    }
    file.puts(data.to_json)
    file.close
  end

  def people_writer(peoples, path)
    file = if File.exist?(path)
             File.open(path, 'a')
           else
             File.open(path, 'w')
           end
    peoples.each do |people|
      student(people, path, file) if people.is_a?(Student)
      teacher(people, path, file) if people.is_a?(Teacher)
    end
  end

  def rent(rental, _path, file)
    data = {
      date: rental.instance_variable_get(:@date),
      book: {
        author: rental.book.author,
        title: rental.book.author
      },
      person: {
        id: rental.person.id,
        name: rental.person.name,
        age: rental.person.age,
        parent_permission: rental.person.instance_variable_get(:@parent_permission)
      }
    }
    file.puts(data.to_json)
    file.close
  end

  def rentals_writer(rentals, path)
    file = if File.exist?(path)
             File.open(path, 'a')
           else
             File.open(path, 'w')
           end
    rentals.each do |rental|
      rent(rental, path, file)
    end
  end
end
