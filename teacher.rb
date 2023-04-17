require_relative 'person'
class Teacspecializationher < Person
  def initialize(name, specialization, age = 'Unknown', permission: true)
    super(name, age, permission: permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new('Anderson', 'Math')
puts teacher1.can_use_services?
