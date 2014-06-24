require './lib/attendee_repository'
require 'pry'

class Queue
  attr_reader :results, :attendees

  def initialize
    @attendees = AttendeeRepository.new.build_people
    @results   = []
  end

  def find_by_first_name(value)
    @results = @attendees.select { |attendee| attendee.first_name == value }
  end

  def find_by_last_name(value)
    @results = @attendees.select { |attendee| attendee.last_name == value }
    return @results
  end

  def find_by_city(value)
    @results = @attendees.select { |attendee| attendee.city == value }
    # return @results
  end

  def find_by_state(value)
    @results = @attendees.select { |attendee| attendee.state == value }
  end

  def find_by_zipcode(value)
    @results = @attendees.select { |attendee| attendee.zipcode == value }
  end

  def find(attribute, criterium)
    @results = @attendees.select { |attendee| attendee.send(attribute) == criterium }
  end

  def clear
    @results = []
  end

  def count
    @results.count
  end

  def queue_print
    puts "LAST NAME".ljust(15) +
      "FIRST NAME".ljust(15) +
      "EMAIL".ljust(40) +
      "ZIPCODE".ljust(10) +
      "CITY".ljust(15) +
      "STATE".ljust(10) +
      "ADDRESS".ljust(30) +
      "PHONE".ljust(15)
    @results.each do |attendee|
      puts attendee.last_name.ljust(15) +
        attendee.first_name.ljust(15) +
        attendee.email_address.ljust(40) +
        attendee.zipcode.ljust(10) +
        attendee.city.ljust(15) +
        attendee.state.ljust(10) +
        attendee.street.ljust(30) +
        attendee.homephone.ljust(15)
    end
  end

end
