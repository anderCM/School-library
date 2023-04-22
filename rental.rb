require 'json'
require_relative 'modules/save_data'

require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'

class Rental
  attr_reader :id
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @id = Random.rand(1...1000)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end

  def add_book(book)
    book.add_rental(self)
  end

  def add_person(person)
    person.add_rental(self)
  end
end
include SaveData
student = Student.new('Anderson232', 'Student', 'C-112', 22)

teacher = Teacher.new('Sophie', 'Teacher', 'Math', 56)

book1 = Book.new('Movie Dick :v', 'El dick')
book2 = Book.new('Movie Dick 2 :v', 'El dick 2')

rental1 = Rental.new('2023-04-21', student, book1)
rental2 = Rental.new('2022-03-29', teacher, book2)

rentals = [rental1, rental2]
save_rentals(rentals)

file = File.read('data/rentals.json')
data = JSON.parse(file)
puts data
exit
