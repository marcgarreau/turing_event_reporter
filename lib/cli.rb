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
    while input != 'quit'
      print "Load Menu: load, help, or quit? \n"
      print ">"
      input = gets.strip
      input_parser(input)
    end
  end

  def find_menu
    input = ''
    while input != 'quit'
      print "Find Menu: find <criteria> <attribute> \n"
      print ">"
      input = gets.strip
      input_parser(input)
    end
  end

  def queue_menu
    input = ''
    while input != 'quit'
      print "Queue Menu: you know what to do, jerk \n"
      print ">"
      input = gets.strip
      input_parser(input)
    end
  end

  def input_parser(input)
    input = input.split(' ')
    parameters = input[1..-1]
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
    if parameters == []
      puts "Loading default file..."
      AttendeeRepository.new
      find_menu
    elsif parameters =~ /.csv/
      puts "Loading \'#{parameters}\'"
      AttendeeRepository.new(parameters)
      find_menu
    else
      puts "That looks like an invalid file."
    end
  end

  def find_command_parser(parameters)
     attribute = parameters[0]
     criteria = parameters[1..-1].join
     @q = Queue.new
     @results = @q.find(attribute, criteria)
     if @results.empty?
       puts "Nobody matches. Seek help!"
    #  elsif #things don't work
    #    puts "invalid command"
     else
       puts "Queue loaded"
       queue_menu
     end
   end

  def help_command_parser(parameters)
     case parameters
     when "load" then Help.load
     when "queue" then Help.queue
     when "find" then Help.find
     else Help.help
     end
  end

  def queue_command_parser(parameters)
    queue_command = parameters[0]
    if parameters[1] == 'by'
     criteria = parameters[2..-1].join
    elsif parameters[1] == 'to'
     criteria = parameters[2..-1].join
    end

    case queue_command
    when "print" then @q.queue_print(criteria)
    when "save" then @q.save(criteria)
    when "clear" then @q.clear
    when "count" then @q.count
    else puts "Invalid command. Seek help!"
    end
  end
end
