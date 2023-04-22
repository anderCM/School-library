require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :role

  def initialize(name, role, specialization, age = 'Unknown', permission: true)
    super(name, role, age, permission: permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
