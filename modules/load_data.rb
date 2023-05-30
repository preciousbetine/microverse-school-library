require 'json'

module LOADDATA
  def load_books
    file_path = './data/books.json'
    if File.exist?(file_path)
      books_json = File.read(file_path)
      books_data = JSON.parse(books_json)
      books_data.each do |book|
        id = book['id']
        title = book['title']
        author = book['author']
        new_book = Book.new(title, author, id: id)
        @books << new_book
      end
    else
      puts 'No saved books available!'
    end
  end

  def load_persons
    file_path = './data/persons.json'
    if File.exist?(file_path)
      persons_json = File.read(file_path)
      persons_data = JSON.parse(persons_json)
      persons_data.each do |person|
        name = person['name']
        age = person['age']
        parent_permission = person['parent_permission']
        id = person['id']
        if person['classroom']
          classroom_label = person['classroom']
          classroom = Classroom.new(classroom_label)
          student = Student.new(age, classroom, name, parent_permission: parent_permission, id: id)
          @students << student
        else
          specialization = person['specialization']
          teacher = Teacher.new(
            age,
            specialization,
            name,
            parent_permission: parent_permission,
            id: id
          )
          @teachers << teacher
        end
      end
    else
      puts 'No saved persons available!'
    end
  end

  def load_rentals
    file_path = './data/rentals.json'
    if File.exist?(file_path)
      rentals_json = File.read(file_path)
      rentals_data = JSON.parse(rentals_json)
      rentals_data.each do |rental|
        person_id = rental['person_id']
        date = rental['date']
        book_id = rental['book_id']

        book = @books.find { |b| b.id == book_id }
        person = @teachers.find { |teacher| teacher.id == person_id } ||
                 @students.find { |student| student.id == person_id }

        new_rental = Rental.new(date, book, person)
        person.add_rental(new_rental)
      end
    else
      puts 'Rentals file not found:'
    end
  end

  def load_data
    load_books
    load_persons
    load_rentals
  end
end
