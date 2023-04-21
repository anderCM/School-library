require_relative 'person'
require_relative 'classroom'
class Student < Person
  attr_accessor :classroom

  def initialize(name, classroom, belong_class, age, permission)
    super(name, age, permission: permission)
    @classroom = classroom
    @belong_class = belong_class
  end

  def add_to_classroom(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
