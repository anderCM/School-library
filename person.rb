require_relative 'nameable'
require_relative './decorators/capitalize'
require_relative './decorators/trim'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  attr_reader :id, :permission
  attr_accessor :name, :age, :rentals

  def initialize(name, age = 'Unknown', id= Random.rand(1...1000), permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @permission = permission
    @rentals = []
  end

  def of_age?
    (@age.is_a? Numeric) && (@age >= 18)
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  private

  def can_use_services?
    @age >= 18 || @permission
  end
end
