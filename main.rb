require './app.rb'

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

def main
  app = App.new
  loop do
    show_menu()
    input = gets.chomp
    case input.to_i
    when 1
      app.list_all_books()
      gets
    when 2
    when 3
    when 4
      app.create_book()
      gets
    when 5
    when 6
    when 7
      puts 'Goodbye!'
      break
    else
      puts
      puts 'Please enter a valid option!'
    end
  end
end

main()
