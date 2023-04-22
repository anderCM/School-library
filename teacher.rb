require_relative 'person'
require_relative 'modules/save_data'

class Teacher < Person
  attr_accessor :specialization, :role

  def initialize(name, specialization, age = 'Unknown', permission: true, role: 'Teacher')
    super(name, age, permission: permission)
    @specialization = specialization
    @role = role
  end

  def can_use_services?
    true
  end
end
