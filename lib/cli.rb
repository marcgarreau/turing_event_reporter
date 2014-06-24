require './lib/attendee_repository'
require './lib/queue'
require './lib/help'
require 'pry'

class Cli
  include Help

  def start
    system('clear')
    puts "Welcome to EventReporter"
    input = '' # get rid of you lateR?
    while !wants_to_quit?
      print "Load Menu: load, help, or quit? \n"
      print ">"
      parts = process_input(gets.chomp)
      assigns_instructions(parts)
      case @command
      when "load"  # how to account for bad file path or garbage input w/out breaking?
        if @parameters
          AttendeeRepository.new(@parameters) && find_repl
        else #@parameters == "" #|| returns error
          AttendeeRepository.new && find_repl
        # else#how do we reach else?
        #   puts "error"
        end
      when "help" then Help.load_help
      when wants_to_quit?
      end
    end
  end

  def find_repl
    # system('clear')
    input = ''
    while @command != 'quit'
      print "Find Attendees Menu: find, help, or quit? \n"
      print ">"
      parts = process_input(gets.chomp)
      find_assigns_instructions(parts)
      case @command
      when "find"
        puts "find things!"# do something
        # binding.pry
        q = Queue.new
        @results = q.find(@attribute,@criteria)
        puts "Queue created!"
        q.queue_print
        queue_repl
      when "help" then Help.find_help
      when "help find" then Help.find_command_help
      # when "quit" then break
      end
    end
  end

  def find_assigns_instructions(parts)
    if parts[0] == "find"
      @command = parts[0]
      @attribute = parts[1]
      @criteria = format_parameters(parts[2..-1]) if parts[2]
      # Queue.new.find(@attribute,@criteria)
    elsif parts[0] == "help"
      @command = parts[0]
      @attribute = parts[1] if parts[1]
    elsif parts[0] == "quit"
        @command = parts[0]
    else
      puts "Invalid command."
      # @command = parts[0]
      # @parameters = format_parameters(parts[1..-1]) if parts[1..-1].include?(/.csv/)
    end
  end

  def queue_repl
    # system('clear')
    input = ''
    while @command != 'quit'
      print "Queue Menu: queue count, queue clear, save, print, help, or quit? \n"
      print ">"
      parts = process_input(gets.chomp)
      queue_assigns_instructions(parts)
      case @command
      when "find"
        puts "find things!"# do something
        # binding.pry
        q = Queue.new
        @results = q.find(@attribute,@criteria)
        puts "Queue created!"
        q.queue_print
        queue_repl
      when "help" then Help.find_help
      when "help find" then Help.find_command_help
      # when "quit" then break
      end
    end
  end

  def assigns_instructions(parts)
    if parts[1] == "first_name"
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
