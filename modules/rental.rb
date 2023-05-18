require_relative '../classes/rental'

module RENTAL
  def rental_pre_check
    puts 'No books available for rent!' if @books.empty?
    return false if @books.empty?

    puts 'No person available to rent!' if @students.empty? && @teachers.empty?
    return false if @students.empty? && @teachers.empty?

    true
  end

  def book_details
    book_index = 0
    loop do
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
      print 'Your input: '
      book_index = gets.strip.to_i
      break unless book_index - 1 > @books.length
    end
    @books[book_index]
  end

  def person_details
    person_index = 0
    all_people = @teachers + @students
    loop do
      puts 'Select a person from the following list by number'
      all_people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}"
      end
      print 'Your input: '
      person_index = gets.strip.to_i
      break unless person_index - 1 > all_people.length
    end
    all_people[person_index]
  end

  def create_rental
    puts 'Create a new rental'
    return unless rental_pre_check

    book = book_details
    person = person_details

    puts "Today's date is #{Date.today}"
    rental = Rental.new(Date.today, book, person)
    person.add_rental(rental)
    puts 'Rental created successfully!'
  end

  def person_select(people)
    puts 'Select a person from the following list by number'
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}"
    end
    print 'Your input: '
    person_index = gets.strip.to_i
    if person_index - 1 > people.length
      puts 'Invalid value entered!'
      return
    end
    people[person_index]
  end

  def list_person_rentals
    all_people = @teachers + @students

    puts 'No persons available!' if all_people.empty?
    return if all_people.empty?

    person = person_select(all_people)
    puts "All #{person.name}'s rentals:" unless person.rentals.empty?
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
    puts "#{person.name} has no rentals." unless person.rentals.length.positive?
  end
end
