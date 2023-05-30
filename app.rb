require 'date'
require_relative 'modules/book'
require_relative 'modules/person'
require_relative 'modules/rental'
require_relative 'modules/io'
require_relative 'modules/load_data'

class App
  def initialize
    @books = []
    @students = []
    @teachers = []
  end

  include BOOK
  include PERSON
  include RENTAL
  include SAVEDATA
  include LOADDATA
end
