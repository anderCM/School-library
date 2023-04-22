require_relative 'modules/get_data'
require_relative 'modules/save_data'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :books, :people, :rentals

  include GetData
  include SaveData

  def initialize
    @books = load_books
    @people = load_people
    @rentals = load_rentals
  end

  def list_books
    if @books.empty?
      puts('No books yet')
    else
      @books.each.with_index do |book, i|
        puts "#{i}) Title: #{book['title']}, Author: #{book['author']}"
      end
    end
  end

  def list_people
    puts @people
    if @people.empty?
      puts('No people yet')
    else
      @people.each.with_index do |person, i|
        puts "#{i}) [#{person['role']}] Name: #{person['name']}, ID: #{person['id']}, age: #{person['age']}"
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    print "title: #{title}, author: #{author}"

    book = Book.new(title, author)
    save_books([book])
    @books = load_books
    puts 'Book created successfully!'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp
    begin
      input = Integer(input)
      create_person_role(input)
    rescue ArgumentError
      puts 'Invalid input. Please enter a number'
    end
  end

  def create_person_role(input)
    case input
    when 1
      new_student
    when 2
      new_teacher
    else
      raise ArgumentError, 'Invalid input. Please enter 1 or 2'
    end
  end

  def new_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.capitalize

    print 'Classroom: '
    classroom = gets.chomp.upcase

    print 'Has parent\'s permission? [Y/N]: '
    parent_permission = gets.chomp.upcase == 'Y'

    student = Student.new(name, classroom, parent_permission, age)
    save_people([student])
    @people = load_people
    puts 'Student created succesfully!'
  end

  def new_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.capitalize
    print 'Specialization: '
    specialization = gets.chomp.capitalize

    teacher = Teacher.new(name, specialization, age)
    save_people([teacher])
    @people = load_people
    puts 'Teacher created succesfully!'
  end

  def new_rental
    puts 'Select a book from the following list by number'
    list_books
    selected_book = gets.chomp.to_i
    book_data = @books[selected_book]
    book = Book.new(book_data['title'], book_data['author'])

    puts 'Select a person from the following list by number'
    list_people
    selected_person = gets.chomp.to_i
    person_data = @people[selected_person]
    person = Person.new(person_data['name'], person_data['age'], permission: person_data['permission'])

    print 'Date (YYYY/MM/DD): '
    date = gets.chomp

    rental = Rental.new(date, person, book)
    save_rentals([rental])
    @rentals = load_rentals
    puts 'Rental created succesfully!'
  end

  def list_rentals
    if @rentals.empty?
      puts 'No rentals yet'
    else
      print 'ID person: '
      id_person = gets.chomp.to_i
      person_rentals = @rentals.select { |rental| rental['id_person'] == id_person }

      if person_rentals.empty?
        puts 'Person ID not found'
      else
        person_rentals.each do |rental|
          id_book = rental['id_book']
          book = @books.find { |s_book| s_book['id'] == id_book }
          puts "Date: #{rental['date']}, Book: \"#{book['title']}\" by #{book['author']}"
        end
      end
    end
  end
end
