require 'json'

module SAVEDATA
  def save
    all_books = []
    @books.each do |book|
      all_books << {
        title: book.title,
        author: book.author
      }
    end
    books_json = JSON.generate(all_books)

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

    File.open('./data/books.json', 'w') {
      |f| f.write books_json
    }
    File.open('./data/persons.json', 'w') {
      |f| f.write persons_json
    }

  end
end
