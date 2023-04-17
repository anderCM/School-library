require_relative 'person'
class Teacher < Person
  def initialize(name, especialization, age = 'Unknown', permission: true)
    super(name, age, permission: permission)
    @especialization = especialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new('Anderson', 'Math')
puts teacher1.can_use_services?
