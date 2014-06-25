require './lib/attendee_repository'
require './lib/queue'
require './lib/help'
require 'pry'

class Cli
  include Help

  def start
    @queue = Queue.new([])
    system('clear')
    puts "Welcome to EventReporter"
    @quit = false
    input = ''
    while @quit == false
      print "Load Menu: load, help or quit? \n"
      print ">"
      input = gets.strip
      input_parser(input)
    end
    puts "Goodbye!"
  end

  def find_menu
    input = ''
    while input != 'back' && @quit == false
      print "Find Menu: help, back, find <attribute> <value> \n"
      print ">"
      input = gets.strip
      input_parser(input)
    end
  end

  def queue_menu
    input = ''
    while input != 'back' && @quit == false
      print "Queue Menu: you know what to do, jerk \n"
      print ">"
      input = gets.strip
      input_parser(input)
    end
  end

  def input_parser(input)
    input = input.split(' ')
    parameters = input[1..-1]
    case input[0].downcase
    when "load" then load_command_parser(parameters)
    when "find" then find_command_parser(parameters)
    when "queue" then queue_command_parser(parameters)
    when "help" then help_command_parser(parameters)
    when "back" then #
    when "quit" then @quit = true
    else
      puts "That is an invalid selection"
    end

  end

  def load_command_parser(parameters)
    if parameters == []
      puts "Loading default file..."
      @repo = AttendeeRepository.new.build_people
      find_menu
    elsif parameters[0] =~ /.csv/
      puts "Loading \'#{parameters[0]}\'"
      @repo = AttendeeRepository.new(parameters[0]).build_people
      find_menu
    else
      puts "That looks like an invalid file."
    end
  end

  def find_command_parser(parameters)
    attribute = parameters[0].downcase
    criteria = parameters[1..-1].map(&:capitalize).join(' ')
     if attribute == "state"
       criteria.upcase!
     end
     @queue = Queue.new(@repo)
     @results = @queue.find(attribute, criteria)
     if @results.empty?
       puts "Nobody matches. Make sure you have loaded a file. Seek help!"
     else
       puts "Queue loaded"
       queue_menu
     end
   end

  def help_command_parser(parameters)
    command = parameters[0]
    case command
    when "load" then Help.load
    when "queue" then Help.queue
    when "find" then Help.find
    else Help.help
    end
    subcommand = parameters[1]
    case subcommand
    when "print" then Help.queue_print
    when "count" then Help.queue_count
    when "clear" then Help.queue_clear
    when "save" then Help.queue_save
    end
  end

  def queue_command_parser(parameters)
    if !@queue.nil?
      queue_command = parameters[0]
      if parameters[1] == 'by'
       criteria = parameters[2..-1].join
      elsif parameters[1] == 'to'
       criteria = parameters[2..-1].join
      end

      case queue_command
      when "print" then @queue.queue_print(criteria)
      when "save" then @queue.save(criteria)
      when "clear" then @queue.clear
      when "count" then @queue.count
      else puts "Invalid command. Seek help!"
      end
    else puts "You must load a file and find by an attribute before you can use queue commands."
    end
  end
end
