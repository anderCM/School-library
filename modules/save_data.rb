require 'json'
require 'fileutils'

module SaveData
  def read_file(file)
    path = File.join(__dir__, '../data', "#{file}.json")
    return [] unless File.exist?(path)

    data = JSON.parse(File.read(path))
    data.is_a?(Array) ? data : []
  end

  def write_file(file, data)
    path = File.join(__dir__, '../data', "#{file}.json")

    FileUtils.mkdir_p('./data')

    File.write(path, JSON.pretty_generate(data))
  end

  def save_books(books)
    existing_data = read_file('books')
    new_data = books.map { |book| { id: book.id, title: book.title, author: book.author } }
    all_data = existing_data + new_data

    return if all_data.empty?

    write_file('books', all_data)
  end

  def save_people(people)
    existing_data = read_file('people')
    new_data = people.map do |person|
      data_person = { id: person.id, name: person.name, age: person.age, role: person.role }

      if person.role == 'Teacher'
        data_person[:specialization] = person.specialization
      elsif person.role == 'Student'
        data_person[:classroom] = person.classroom
        data_person[:permission] = person.permission
      end

      data_person
    end

    all_data = existing_data + new_data
    return if all_data.empty?

    write_file('people', all_data)
  end

  def save_rentals(rentals)
    existing_data = read_file('rentals')
    new_data = rentals.map do |rental|
      data_rental = {
        id: rental.id,
        date: rental.date,
        id_book: rental.book.id,
        id_person: rental.person.id
      }
      data_rental
    end
    all_data = existing_data + new_data
    return if all_data.empty?

    write_file('rentals', all_data)
  end
end
