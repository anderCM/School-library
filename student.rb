require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom, :role

  def initialize(name, classroom, permission, age = 'Unknown', role: 'Student')
    super(name, age, permission: permission)
    @classroom = classroom
    @role = role
  end

  def add_to_classroom(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
