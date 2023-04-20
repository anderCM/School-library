class Rental
  attr_accessor :date, :person

  def initialize(date)
    @date = date
    @person = person
  end

  def add_book(book)
    book.add_rental(self)
  end
end
