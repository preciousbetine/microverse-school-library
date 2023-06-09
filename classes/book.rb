class Book
  attr_reader :id
  attr_accessor :title, :author, :rentals

  def initialize(title, author, id: Random.rand(1..1000))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end
end
