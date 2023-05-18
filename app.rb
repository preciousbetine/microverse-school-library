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
    @rentals = []
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
      puts 'Press any key to continue'
      puts
      return
    end

    puts "All books (#{@books.length})"
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts 'Press any key to continue'
    puts
  end

  def list_all_people
    if @students.length != 0
      puts 'All students: '
      @students.each_with_index do |student, index|
        puts "#{index+1}. Name: #{student.name}, Age: #{student.age}, Classroom: #{student.classroom.label}"
      end
    end
    if @teachers.length != 0
      puts 'All teachers: '
      @teachers.each_with_index do |teacher, index|
        puts "#{index+1}. Name: #{teacher.name}, Age: #{teacher.age}, Specialization: #{teacher.specialization}"
      end
    end
    puts 'No persons available!' unless @students.length > 0 || @teachers.length > 0
    puts 'Press any key to continue...'
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'
    name = ''
    age = ''

    loop do
      print 'Your input: '
      input = gets.strip.to_i
      case input
      when 1
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
        puts 'Student created successfully! Press any key to continue...'
        break
      when 2
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
        puts 'Teacher created successfully! Press any key to continue...'
        break
      when 3
        puts 'Create person cancelled! Press any key to continue...'
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
    puts 'Press any key to continue'
    puts
  end

  def create_rental
    puts 'Create a new rental'
    if @books.length == 0
      puts 'No books available for rent!'
      puts 'Press any key to continue...'
      return
    end

    if @students.length == 0 && @teachers.length == 0
      puts 'No person available to rent!'
      puts 'Press any key to continue...'
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
    @rentals << rental
    puts 'Rental created successfully!'
    puts 'Press any key to continue...'
  end

  def list_person_rentals(person_id)

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
      when 7
        puts 'Goodbye!'
        break
      else
        puts
        puts 'Please enter a valid option! Press any key to continue...'
      end
      gets
    end
  end
end
