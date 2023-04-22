require_relative 'modules/get_data'
require_relative 'modules/save_data'
require_relative 'app'

class Run
  include GetData
  include SaveData

  def initialize
    @app = App.new
  end

  def start
    puts 'Welcome to School Library App!'

    loop do
      app_options
      input = gets.chomp

      begin
        input = Integer(input)
        options(input)
      rescue ArgumentError
        puts 'Invalid input. Please enter a number'
      end
    end
  end

  def app_options
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rental for a given person id'
    puts '7 - Exit'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def options(input)
    case input
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.new_rental
    when 6
      @app.list_rentals
    when 7
      puts 'Thanks for using the school library App!'
      exit
    else
      puts 'Invalid Entry'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
