require './app'

class Menu
  def initialize(app)
    @app = app
  end

  def display
    puts 'Welcome to School Library App!'
    loop do
      display_menu
      option = gets.chomp.to_i
      handle_option(option)
      break if option == 7
    end
  end

  private

  def display_menu
    puts ' '
    puts 'Please select an option (number only)'
    puts '[1] List all books'
    puts '[2] List all people'
    puts '[3] Create a person'
    puts '[4] Create a book'
    puts '[5] Create a rental'
    puts '[6] List all rentals for a given person'
    puts '[7] Exit'
  end

  def handle_option(option)
    option_actions = {
      1 => -> { @app.list_all_books },
      2 => -> { @app.list_all_people },
      3 => -> { @app.create_person },
      4 => -> { @app.create_book },
      5 => -> { @app.create_rental },
      6 => -> { @app.list_all_rentals },
      7 => -> { puts 'Exiting. Thank you for using this App.' },
      default: -> { puts 'Enter a number between 1 and 7.' }
    }

    action = option_actions[option] || option_actions[:default]
    action.call
  end
end
