require_relative 'save_data'
module GetData
  include SaveData
  def load_books
    read_file('books') || []
  end

  def load_peopls
    read_file('people') || []
  end

  def get_rentals(id)
    data = read_file('rentals')
    return [] if data.empty?

    data.select { |rental| rental['id_person'] == id }
  end

  def get_person(id)
    data = read_file('people')
    return [] if data.empty?

    data.find { |person| person['id'] == id }
  end

  def get_book(id)
    data = read_file('books')
    return [] if data.empty?

    data.find { |book| book['id'] == id }
  end
end
