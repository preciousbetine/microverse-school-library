require_relative 'classes/book'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/classroom'

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
      when 3
        create_person
      when 4
        create_book
      when 5
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
