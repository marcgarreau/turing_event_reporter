require './lib/attendee_repository'
require 'pry'

class Queue
  attr_reader :results, :attendees

  def initialize
    @attendees = AttendeeRepository.new.build_people
    @results   = []
  end

  def find(attribute, criterium)
    @results = @attendees.select { |attendee| attendee.send(attribute) == criterium }
  end

  def clear
    puts "Queue cleared!"
    @results = []
  end

  def count
    puts @results.count
  end

  def queue_print(criteria)
    if criteria.nil?
      sort_criteria = 'last_name'
    else
      sort_criteria = criteria
    end
    # sort_criteria = criteria

    puts "LAST NAME".ljust(15) +
      "FIRST NAME".ljust(15) +
      "EMAIL".ljust(40) +
      "ZIPCODE".ljust(10) +
      "CITY".ljust(15) +
      "STATE".ljust(10) +
      "ADDRESS".ljust(30) +
      "PHONE".ljust(15)
      # binding.pry
    sorted_results = @results.sort_by do |attendee|
      [attendee.send(sort_criteria), attendee.last_name, attendee.first_name]
    end
    sorted_results.each do |attendee|
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
