require 'json'

module LOADDATA

    def load_books
     file_path = './data/books.json'
    #  file = File.open(file_path, 'r')
    if File.exist?(file_path) 
        books_json = File.read(file_path)
        books_data = JSON.parse(books_json)
        books_data.each do |books_data|
        title = books_data['title']
        author = books_data['author']
        book = Book.new(title, author)
        @books << book
        end
  else
    p "No Book Found:"
  end
 end

 def load_persons
    file_path = './data/persons.json'
    if File.exist?(file_path) 
        persons_json = File.read(file_path)
        persons_data = JSON.parse(persons_json)
        persons_data.each do |person_data|
            name = person_data['name']
            age = person_data['age']
            parent_permission = person_data['parent_permission']
            id = person_data['id']
            if person_data['classroom']
                classroom_label = person_data['classroom']
                classroom = Classroom.new(classroom_label)
                student = Student.new( age, classroom, name)
                @students << student
            else
                specialization = person_data['specialization']
                teacher = Teacher.new(age, specialization, name)
                @teachers << teacher
            end
        end
        else
            puts "Person file Not found!!"
        end
    end

    def load_rentals
        file_path = './data/rentals.json'
        if File.exist?(file_path) 
            rentals_json = File.read(file_path)
            rentals_data = JSON.parse(rentals_json)
            rentals_data.each do |rental_data|
                person_id = rental_data['person_id']
                date = rental_data['date']
                book_id = rental_data['book_id']
                book = Book.new(book_id)
                person = Person.new(person_id)
                rental = Rental.new(date, book)
                person.add_rental(rental)
              end
            else
              puts "Rentals file not found:"
            end
          end
end
