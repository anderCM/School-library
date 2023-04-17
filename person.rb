class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name, age = 'Unknown', permission: true)
    @name = name
    @age = age
    @parent_permission = permission
  end

  def of_age?
    (@age.is_a? Numeric) && (@age >= 18)
  end

  private

  def can_use_services?
    @age >= 18 || @parent_permission
  end
end
