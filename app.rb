require 'date'
require_relative 'modules/book'
require_relative 'modules/person'
require_relative 'modules/rental'

class App
  def initialize
    @books = []
    @students = []
    @teachers = []
  end

  include BOOK
  include PERSON
  include RENTAL

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

  def invalid_option
    puts
    puts 'Please enter a valid option!'
  end

  def process_input(input)
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
    end
  end

  def run
    loop do
      show_menu
      input = gets.chomp
      if input.to_i == 7
        puts 'Goodbye!'
        break
      end
      process_input(input) if (1..6).to_a.include?(input.to_i)
      invalid_option unless (1..6).to_a.include?(input.to_i)

      puts 'Press Enter to continue...'
      gets
    end
  end
end
