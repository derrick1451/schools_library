require_relative 'app'

def display_menu
  puts "\nPlease select an option (number only)"
  puts '[1] List all books'
  puts '[2] List all people'
  puts '[3] Create a person'
  puts '[4] Create a book'
  puts '[5] Create a rental'
  puts '[6] List all rentals for a given person'
  puts '[7] Exit'
end

def handle_option(option, app)
  option_actions = {
    1 => app.method(:list_all_books),
    2 => app.method(:list_all_people),
    3 => app.method(:create_person),
    4 => app.method(:create_book),
    5 => app.method(:create_rental),
    6 => app.method(:list_all_rentals),
    7 => -> { puts 'Exiting' },
    default: -> { puts 'Enter a number between 1 and 7.' }
  }

  action = option_actions[option] || option_actions[:default]
  action.call
end

def main
  app = App.new
  option = 0

  until option == 7
    display_menu
    option = gets.chomp.to_i
    handle_option(option, app)
    app.load_data_from_json
  end
  app.save_data_to_json
end


main
