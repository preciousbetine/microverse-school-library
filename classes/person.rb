require_relative 'nameable'
require_relative 'decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true, id: rand)
    super()
    @id = id
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
