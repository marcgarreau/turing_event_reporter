module Help

  def self.help
      puts "\n[Help Menu]\nFind specific help by entering e.g. 'help load', 'help find', or 'help queue'.\n\n"
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

  def self.queue_print
    puts "\n[Queue Print Help]\nUsage: queue print\nUse this command to print formatted queue results. \nUse this command with the optional \"by\" operator and an attribute to print sorted by the attribute.\n\n"
  end

  def self.queue_count
    puts "\n[Queue Count Help]\nUsage: queue count\nUse this command to display a tally of attendees in your current queue.\n\n"
  end

  def self.queue_clear
    puts "\n[Queue Clear Help]\nUsage: queue clear\nUse this command to reset the current queue.\n\n"
  end

  def self.queue_save
    puts "\n[Queue Save Help]\nUsage: queue save to <filename>\nExample: queue save to fake.csv\nUse this command to save your current sorted queue to a .csv file.\nUse this command with the optional \"by\" operator and an attribute to print sorted by the attribute.\n\n"
  end
end
