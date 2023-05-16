require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def can_use_services?
    of_age? && @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

per = Person.new(20)
p per.correct_name
