require 'pry'
require 'csv'
require './lib/attendee'

class AttendeeRepository
  attr_reader :records

  def initialize(file="./data/event_attendees.csv")
    @records  = []
    @contents = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def build_people
    @records = @contents.map {|row| Attendee.build(row)}
    return @records
  end
end
