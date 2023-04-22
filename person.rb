require_relative 'nameable'
require_relative './decorators/capitalize'
require_relative './decorators/trim'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  attr_reader :id, :permission
  attr_accessor :name, :age, :rentals, :role

  def initialize(name, role, age = 'Unknown', permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @permission = permission
    @role = role
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
