require './lib/loader'
require './lib/queue'

require 'pry'

class Cli

  def start
    system('clear')
    puts "Welcome to EventReporter"
    input = ''
    unless wants_to_quit?
      print "Load Menu: load, help, or quit? \n"
      print ">"
      parts = process_input(gets.chomp)
      assigns_instructions(parts)
      case @command
      when "load"  # how to account for bad file path or garbage input w/out breaking?
        if @parameters
          AttendeeRepository.new(@parameters)
        else #@parameters == "" #|| returns error
          AttendeeRepository.new
        # else#how do we reach else?
        #   puts "error"
        end
      when "help" then load_help
      end
    end

  end

  def assigns_instructions(parts)
    if parts[1] == "-r"
      @command = parts[0..1].join(" ")
      @parameters = format_parameters(parts[2..-1])
    else
      @command = parts[0]
      @parameters = format_parameters(parts[1..-1]) if parts[1..-1].include?(/.csv/)
    end
  end

  def format_parameters(parameters)
    parameters.join(' ').gsub(/["']/, '')
  end

  def wants_to_quit?
    @command == "q" || @command == "quit"
  end

  def process_input(input)
    input.split(' ')
  end

  def load_help
    puts "This is how you use the load..."
  end

  def wants_help?
    @command == "h" || @command == "help"
  end

  # def start
  #   puts "Welcome"
  #   while command != "quit"
  #     print "Enter your command (or 'help'): "
  #     parts = process_input(gets.chomp)
  #     assigns_instructions(parts)
  #     execute_commands
  #   end
  #   puts "Goodbye."
  # end

  #
  # def assigns_instructions(parts)
  #   if parts[1] == "-r"
  #     @command = parts[0..1].join(" ")
  #     @parameters = format_parameters(parts[2..-1])
  #   else
  #     @command = parts[0]
  #     @parameters = format_parameters(parts[1..-1])
  #   end
  # end
  #
  # def execute_commands
  #   puts "Executing #{command}..."
  #   case command
  #   when "queue"
  #     output = Queue.queue_print
  #     puts output
  #     output
  #   when "lookup -r"
  #     output = phone_book.reverse_lookup(parameters)
  #     puts output
  #     output
  #   when "help"
  #     puts 'You can use:
  #     lookup "LastName, FirstName"
  #     lookup "LastName"
  #     lookup -r (###) ###-####'
  #   else
  #     puts "That's not a valid command. Type 'help' for valid commands."
  #   end
  # end

end
