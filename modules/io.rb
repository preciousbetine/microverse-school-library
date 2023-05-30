require 'json'

module SAVEDATA
  def save_books
    all_books = []
    @books.each do |book|
      all_books << {
        title: book.title,
        author: book.author
      }
    end
    books_json = JSON.generate(all_books)
    File.open('./data/books.json', 'w') {
      |f| f.write books_json
    }
  end

  def save_persons
    all_persons = []
    @students.each do |student|
      all_persons << {
        id: student.id,
        name: student.name,
        parent_permission: student.parent_permission,
        age: student.age,
        classroom: student.classroom.label
      }
    end
    @teachers.each do |teacher|
      all_persons << {
        id: teacher.id,
        name: teacher.name,
        parent_permission: teacher.parent_permission,
        age: teacher.age,
        specialization: teacher.specialization,
      }
    end
    persons_json = JSON.generate(all_persons)
    File.open('./data/persons.json', 'w') {
      |f| f.write persons_json
    }
  end

  def save_rentals
    all_rentals = []
    @students.each do |student|
      student.rentals.each do |rental|
        all_rentals << {
          person_id: student.id,
          date: rental.date,
          book_id: rental.book.id
        }
      end
    end
    @teachers.each do |teacher|
      teacher.rentals.each do |rental|
        all_rentals << {
          person_id: teacher.id,
          date: rental.date,
          book_id: rental.book.id
        }
      end
    end
    rentals_json = JSON.generate(all_rentals)
    File.open('./data/rentals.json', 'w') {
      |f| f.write rentals_json
    }
  end

  def save
    save_books
    save_persons
    save_rentals
  end
end
