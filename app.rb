require './classes/book'

class App
  def initialize
    @books = []
  end

  def list_all_books
    if @books.length == 0
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
end
