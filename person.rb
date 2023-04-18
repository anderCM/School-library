require_relative 'nameable'
require_relative './decorators/capitalize'
require_relative './decorators/trim'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name, age = 'Unknown', permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = permission
  end

  def of_age?
    (@age.is_a? Numeric) && (@age >= 18)
  end

  def correct_name
    @name
  end

  private

  def can_use_services?
    @age >= 18 || @parent_permission
  end
end

person = Person.new('maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
