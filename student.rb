require_relative 'person'
class Student < Person
  def initialize(name, classroom, age = 'Unknown', permission: true)
    super(name, age, permission: permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
