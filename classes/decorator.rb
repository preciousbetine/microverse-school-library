require './nameable'

class Decorator < Nameable
  def initialize(nameable_object)
    @nameable_object = nameable_object
  end

  def correct_name
    @nameable_object.correct_name
  end
end
