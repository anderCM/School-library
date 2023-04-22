class Book
  attr_reader :id
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @id = Random.rand(1...1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
end
