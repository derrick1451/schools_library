require 'json'
require './student'
require './teacher'
require './rental'
require './book'
require './classroom'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    return puts '0 Books currently available' if @books.empty?

    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title} by Author: #{book.author}"
    end
  end

  def list_all_people
    return puts 'No people Registered' if @people.empty?

    @people.each_with_index do |person, index|
      puts "#{index + 1}. [#{person.class}], id: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person
    loop do
      puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      input = gets.chomp

      case input
      when '1'
        create_student
        break
      when '2'
        create_teacher
        break
      else
        puts 'Invalid input. Please choose 1 for student or 2 for teacher.'
      end
    end
  end

  # ... Existing methods ...

  def save_data_to_json
    save_books_to_json
    save_people_to_json
    save_rentals_to_json
  end

  def load_data_from_json
    load_books_from_json
    load_people_from_json
    load_rentals_from_json
  end

  private

  # ... Existing methods ...

  def save_books_to_json
    File.write('books.json', JSON.generate(@books))
  end

  def save_people_to_json
    File.write('people.json', JSON.generate(@people))
  end

  def save_rentals_to_json
    File.write('rentals.json', JSON.generate(@rentals))
  end

  def load_books_from_json
    @books = begin
      JSON.parse(File.read('books.json'))
    rescue StandardError
      []
    end
  end

  def load_people_from_json
    @people = begin
      JSON.parse(File.read('people.json'))
    rescue StandardError
      []
    end
  end

  def load_rentals_from_json
    @rentals = begin
      JSON.parse(File.read('rentals.json'))
    rescue StandardError
      []
    end
  end
end

def main
  app = App.new
  app.load_data_from_json

  option = 0

  until option == 7
    display_menu
    option = gets.chomp.to_i
    handle_option(option, app)
  end

  app.save_data_to_json
end

main
