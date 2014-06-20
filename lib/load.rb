require 'csv'

class Load
  attr_reader :contents

  def initialize(csv='./data/event_attendees.csv')
    @contents = CSV.open csv, headers: true, header_converters: :symbol
  end

  puts "fuck it! we'll do it live!"
  puts @contents


end

if __FILE__ == $0
  Load.new
end
