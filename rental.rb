require 'json'

require_relative 'modules/save_data'
require_relative 'person'
require_relative 'book'

class Rental
  attr_reader :id, :rentals
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
