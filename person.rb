require_relative 'nameable'
require_relative './decorators/capitalize'
require_relative './decorators/trim'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name, age = 'Unknown', permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = permission
    @rentals = []
  end

  def of_age?
    (@age.is_a? Numeric) && (@age >= 18)
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  private

  def can_use_services?
    @age >= 18 || @parent_permission
  end
end

person = Person.new('Juan')
book = Book.new('Los Miserables', 'Victor Hugo')
rental = Rental.new('2023-04-20', person, book)


puts "Rental date: #{rental.date}"
puts "Rental person name: #{rental.person.name}"
puts "Rental book title: #{rental.book.title}"
