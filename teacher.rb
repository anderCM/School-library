require_relative 'person'
class Teacher < Person
  def initialize(name, specialization, belong_class, age, permission: true)
    super(name, age, permission: permission)
    @specialization = specialization
    @belong_class = belong_class
  end

  def can_use_services?
    true
  end
end
