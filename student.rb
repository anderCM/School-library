require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(name, role, classroom, age = 'Unknown', permission: true)
    super(name, role, age, permission: permission)
    @classroom = classroom
  end

  def add_to_classroom(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
