require 'json'

module LOADDATA
  def read_books_data
    file_path = './data/books.json'
    books_data = nil
    if File.exist?(file_path)
      books_json = File.read(file_path)
      books_data = JSON.parse(books_json)
    else
      puts 'No previous books available!'
    end
    books_data
  end

  def load_books
    books_data = read_books_data
    return unless books_data

    books_data.each do |book|
      id = book['id']
      title = book['title']
      author = book['author']
      new_book = Book.new(title, author, id: id)
      @books << new_book
    end
  end

  def read_persons_data
    file_path = './data/persons.json'
    persons_data = nil
    if File.exist?(file_path)
      persons_json = File.read(file_path)
      persons_data = JSON.parse(persons_json)
    else
      puts 'No previous persons available!'
    end
    persons_data
  end

  def load_persons
    persons_data = read_persons_data
    return unless persons_data

    persons_data.each do |person|
      if person['classroom']
        classroom = Classroom.new(person['classroom'])
        student = Student.new(person['age'], classroom, person['name'], parent_permission: person['parent_permission'],
                                                                        id: person['id'])
        @students << student
      else
        teacher = Teacher.new(person['age'], person['specialization'], person['name'],
                              parent_permission: person['parent_permission'], id: person['id'])
        @teachers << teacher
      end
    end
  end

  def read_rentals_data
    file_path = './data/rentals.json'
    rentals_data = nil
    if File.exist?(file_path)
      rentals_json = File.read(file_path)
      rentals_data = JSON.parse(rentals_json)
    else
      puts 'No previous rentals!'
    end
    rentals_data
  end

  def load_rentals
    rentals_data = read_rentals_data
    return unless rentals_data

    rentals_data.each do |rental|
      book = @books.find { |b| b.id == rental['book_id'] }
      person = @teachers.find { |teacher| teacher.id == rental['person_id'] } ||
               @students.find { |student| student.id == rental['person_id'] }

      new_rental = Rental.new(rental['date'], book, person)
      person.add_rental(new_rental)
    end
  end

  def load_data
    load_books
    load_persons
    load_rentals
  end
end
