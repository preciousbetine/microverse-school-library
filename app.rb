require './classes/book'

class App
  def initialize
    @books = []
  end

  def list_all_books
    puts 'All available books:'
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
    puts
  end

  def create_rental

  end

  def list_person_rentals(person_id)

  end
end
