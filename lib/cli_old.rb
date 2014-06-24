require './lib/attendee_repository'
require './lib/queue'
require './lib/help'
require 'pry'

class Cli
  include Help

###########################(Intro Menu)#########################
  def start
    system('clear')
    puts "Welcome to EventReporter"
    input = '' # get rid of you lateR?
    while !wants_to_quit?
      print "Load Menu: load, help, or quit? \n"
      print ">"
      input = gets.strip
      input_parser(input)
      # parts = process_input(gets.chomp)
      # assigns_instructions(parts)
      # case @command
      # when "load"
      #   if @parameters
      #     puts "Loading file..."
      #     AttendeeRepository.new(@parameters) && find_repl
      #   else
      #     puts "Loading default file..."
      #     AttendeeRepository.new && find_repl
      #   end
      # when "help" then Help.load_help
      # when wants_to_quit?
      # end
    end
  end


  def input_parser(input)
    input = input.split(' ')
    parameters = input[1..-1].join(' ')
    # binqding.pry
    case input[0]
    when "load" then load_command_parser(parameters)
    when "find" then find_command_parser(parameters)
    when "queue" then queue_command_parser(parameters)
    when "help" then help_command_parser(parameters)
    when "quit" then #quit
    else
      puts "That is an invalid selection"
    end
  end

  def load_command_parser(parameters)
    if parameters == ''
      puts "Loading default file..."
      AttendeeRepository.new
      find_repl
    elsif parameters =~ /.csv/
      puts "Loading \'#{parameters}\'"
      AttendeeRepository.new(parameters)
      find_repl
    else
      puts "That looks like an invalid file."
    end
  end

  def assigns_instructions(parts)
    if parts[1] == "first_name"
      @command = parts[0..1].join(" ")
      @parameters = format_parameters(parts[2..-1])
    else
      @command = parts[0]
      @parameters = format_parameters(parts[1..-1]) if parts[1..-1] =~ /.csv/ #parts[1..-1].include?(/.csv/)
    end
  end

###########################(Find Menu)#########################
  def find_repl
    input = ''
    while @command != 'quit'
      print "Find Attendees Menu: find, help, or quit? \n"
      print ">"
      parts = process_input(gets.chomp)
      find_assigns_instructions(parts)
      case @command
      when "find" then find_method
      when "help" then Help.find_help
      when "help find" then Help.find_command_help
      end
    end
  end

  def find_method
    puts "find things!"# do something
    @q = Queue.new
    @results = @q.find(@attribute,@criteria)
    puts "Queue created!"
    # @q.queue_print
    queue_repl
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
    end
  end

###########################(Queue Menu)#########################
  def queue_repl
    input = ''
    while input != 'quit'
      print "Queue Menu: queue count, queue clear, save, print, help, or quit? \n"
      print ">"
      input = gets.downcase.strip
      case input
      when "queue print"
        puts "Printing..."
        @q.queue_print
      when "queue count" then puts @q.count
      when "queue clear"
        puts "Queue cleared!"
        @q.clear
      when "queue save to *"
      when "help queue" then Help.queue_command_help
      when "quit" then puts "Exiting queue menu..."
      else
        puts "Invalid command in the queue repl"
      end
    end
  end

###########################(Menu Assets)#########################
  def load(filename)
    filename = @parameter =~ /.csv/
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

end
