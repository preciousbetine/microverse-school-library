require 'date'
require_relative 'classes/book'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/classroom'
require_relative 'classes/rental'

class App
  def initialize
    @books = []
    @students = []
    @teachers = []
  end

  def show_menu
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
    print 'Your input: '
  end

  def list_all_books
    if @books.empty?
      puts 'No book available!'
      return
    end

    puts "All books (#{@books.length})"
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'No persons available!' unless @students.length > 0 || @teachers.length > 0
    list_students
    list_teachers
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'

    loop do
      print 'Your input: '
      input = gets.strip.to_i
      case input
      when 1
        create_student
        puts 'Student created successfully!'
        break
      when 2
        create_teacher
        puts 'Teacher created successfully!'
        break
      when 3
        puts 'Create person cancelled!'
        break
      else
        puts 'Enter 1 for student, or 2 for teacher, 3 to cancel'
      end
    end
    puts
  end

  def create_book
    title = ''
    author = ''
    loop do
      print 'Enter book title: '
      title = gets.strip
      break unless title.length == 0
    end
    loop do
      print 'Enter book author: '
      author = gets.strip
      break unless author.length == 0
    end
    book = Book.new(title, author)
    @books << book
    puts 'New book added!'
  end

  def create_rental
    puts 'Create a new rental'
    if @books.length == 0
      puts 'No books available for rent!'
      return
    end

    if @students.length == 0 && @teachers.length == 0
      puts 'No person available to rent!'
      return
    end

    book_index = 0
    person_index = 0
    all_people = @teachers + @students

    loop do
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
      print 'Your input: '
      book_index = gets.strip.to_i
      break unless book_index - 1 > @books.length
    end

    loop do
      puts 'Select a person from the following list by number'
      all_people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}"
      end
      print 'Your input: '
      person_index = gets.strip.to_i
      break unless person_index - 1 > all_people.length
    end

    puts "Today's date is #{Date.today}"
    rental = Rental.new(Date.today, @books[book_index], all_people[person_index])
    all_people[person_index].add_rental(rental)
    puts 'Rental created successfully!'
  end

  def list_person_rentals
    all_people = @teachers + @students
    person_index = 0

    if all_people.length == 0
      puts 'No persons available!'
      return
    end

    loop do
      puts 'Select a person from the following list by number'
      all_people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}"
      end
      print 'Your input: '
      person_index = gets.strip.to_i
      break unless person_index - 1 > all_people.length
      puts "Invalid value entered!"
    end

    person = all_people[person_index]
    puts "All #{person.name}'s rentals:" unless person.rentals.length == 0
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
    puts "#{person.name} has no rentals." unless person.rentals.length > 0
  end

  def run
    loop do
      show_menu
      input = gets.chomp
      case input.to_i
      when 1
        list_all_books
      when 2
        list_all_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_person_rentals
      when 7
        puts 'Goodbye!'
        break
      else
        puts
        puts 'Please enter a valid option!'
      end
      puts 'Press any key to continue...'
      gets
    end
  end

  private
  def list_students
    if @students.length != 0
      puts 'All students: '
      @students.each_with_index do |student, index|
        puts "#{index+1}. Name: #{student.name}, Age: #{student.age}, Classroom: #{student.classroom.label}"
      end
    end
  end

  def list_teachers
    if @teachers.length != 0
      puts 'All teachers: '
      @teachers.each_with_index do |teacher, index|
        puts "#{index+1}. Name: #{teacher.name}, Age: #{teacher.age}, Specialization: #{teacher.specialization}"
      end
    end
  end

  def create_student
    name = ''
    age = ''
    classroom = ''
    puts 'Creating student...'
    loop do
      print 'Enter student name: '
      name = gets.strip
      break unless name.length == 0
    end
    loop do
      print 'Enter student age: '
      age = gets.strip.to_i
      break unless age == 0
    end
    loop do
      print 'Enter classroom label: '
      classroom_label = gets.strip
      if classroom_label.length
        classroom = Classroom.new(classroom_label)
        break
      else
        puts 'Enter a valid classroom label!'
      end
    end
    student = Student.new(age, classroom, name)
    @students << student
  end

  def create_teacher
    name = ''
    age = ''
    specialization = ''
    puts 'Creating teacher...'
    loop do
      print 'Enter teacher\'s name: '
      name = gets.strip
      break unless name.length == 0
    end
    loop do
      print 'Enter teacher\'s age: '
      age = gets.strip.to_i
      break unless age == 0
    end
    loop do
      print 'Enter teacher\'s specialization: '
      specialization = gets.strip
      break unless specialization.length == 0
    end
    teacher = Teacher.new(age, specialization, name)
    @teachers << teacher
  end
end
