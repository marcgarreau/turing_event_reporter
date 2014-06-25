require 'pry'
require 'csv'
require './lib/attendee'
require './lib/queue'

class AttendeeRepository
  attr_reader :records

  def initialize(file="./data/event_attendees.csv")
    @records  = []
    @contents = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def build_people # have this take place in the initialize?
    @contents.each do |row|
      @records << Attendee.build(row)
    end
    return @records
  end

end

if __FILE__ == $0

end
