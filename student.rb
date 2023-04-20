require_relative 'person'
require_relative 'classroom'
class Student < Person
  attr_accessor :classroom

  def initialize(name, classroom, age = 'Unknown', permission: true)
    super(name, age, permission: permission)
    @classroom = classroom
  end

  def add_to_classroom(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def read_total_students
    classroom.read_students.each { |student| puts "#{student.name} - #{student.classroom.label}" }
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

classroom1 = Classroom.new('Math')
classroom2 = Classroom.new('Art')

student1 = Student.new('Anderson', classroom1)
student2 = Student.new('George', classroom2)
student3 = Student.new('John', classroom1)

student1.add_to_classroom(classroom1)
student2.add_to_classroom(classroom2)
student3.add_to_classroom(classroom2)

[classroom1, classroom2].each do |classroom|
  puts "#{classroom.label} students:"
  classroom.read_students.each { |student| puts "- #{student.name}" }
end
