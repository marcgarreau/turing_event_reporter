module Help

  def self.help
      puts "\n[Help Menu]\nFind specific help by entering 'help load', 'help find', or 'help queue'.\n\n"
  end

  def self.load
    puts "\n[Load Help]\nUsage: load <filename>\nEnter 'load', without parameters, to load default file: event_attendees.csv.\nEnter 'load <filename>' to load a specific file. Do not use quotes when defining the file name.\n\n"
  end

  def self.find
    puts "\n[Find Help]\nUsage: find <attribute> <value>\nExample: find last_name Nguyen\nYou may search by first_name, last_name, city, state, or zipcode.\n\n"
  end

  def self.queue
    puts "\n[Queue Help]\nUsage: queue count\nUsage: queue print\nUsage: queue print by <attribute>\nUsage: queue clear\nUsage: queue save to <filename>\n\n"
  end

  # def self.queue_help
  #   puts "You asked for help while in the queue repl. Coming soon..."
  # end
  #
  # def self.queue_command_help
  #   puts "You can try queue print, queue count, and queue save."
  # end
end
