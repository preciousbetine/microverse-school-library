class Person
  attr_reader :id, :name, :age
  attr_writer :name, :age

  def initialize(age, name = "Unknown", parent_permission = true)
    @id = nil
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  private
  def of_age?
    @age >= 18
  end

  public
  def can_use_services?
    of_age? && @parent_permission
  end
end