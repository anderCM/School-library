class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
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
