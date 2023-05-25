require 'pry'

class Writer
    def booking(book, path, file)
        data = {
            title: book.title,
            author: book.author
        }
        file.puts(data.to_json)
        file.close
    end
    
    def book_writer(books, path)
        if File.exist?(path)
            file = File.open(path, 'a')
            books.each do |book|
                if book.is_a?(Book)
                    booking(book, path, file)
                end
            end
        else
            file = File.open(path, 'w')
            books.each do |book|
                if book.is_a?(Book)
                    booking(book, path, file)
                end
            end
        end
    end

    def student(person, path, file)
        data = {
            id: person.id,
            age: person.age,
            name: person.name,
            parent_permission: person.instance_variable_get(:@parent_permission)
        }
        file.puts(data.to_json)
        file.close
    end

    def teacher(person, path, file)
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
        if File.exist?(path)
            file = File.open(path, 'a')
            peoples.each do |people|
                if people.is_a?(Student)
                    student(people, path, file)
                end
                if people.is_a?(Teacher)
                    teacher(people, path, file)
                end
            end
        else
            file = File.open(path, 'w')
            peoples.each do |people|
                if people.is_a?(Student)
                    student(people, path, file)
                end
                if people.is_a?(Teacher)
                    teacher(people, path, file)
                end
            end
        end
    end

    def rent(rental, path, file)
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
        if File.exist?(path)
            file = File.open(path, 'a')
            rentals.each do |rental|
                rent(rental, path, file)
            end
        else
            file = File.open(path, 'w')
            rentals.each do |rental|
                rent(rental, path, file)
            end
        end
    end
end