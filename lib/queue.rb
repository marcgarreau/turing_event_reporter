require './lib/attendee_repository'
require 'pry'

class Queue
  attr_reader :results, :attendees

  def initialize(repo)
    @attendees = repo
    @results   = []
  end

  def find(attribute, criterium)
    @attendees ||= []
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
      @sort_criteria = 'last_name'
    else
      @sort_criteria = criteria
    end

    puts "-".ljust(155,'-')
    puts "LAST NAME".ljust(15) +
      "FIRST NAME".ljust(15) +
      "EMAIL".ljust(40) +
      "ZIPCODE".ljust(10) +
      "CITY".ljust(20) +
      "STATE".ljust(10) +
      "ADDRESS".ljust(30) +
      "PHONE".ljust(15)
    puts "-".ljust(155,'-')

      sort_result

    @sorted_results.each do |attendee|
      puts attendee.last_name.ljust(15) +
        attendee.first_name.ljust(15) +
        attendee.email_address.ljust(40) +
        attendee.zipcode.ljust(10) +
        attendee.city.ljust(20) +
        attendee.state.ljust(10) +
        attendee.street.ljust(30) +
        attendee.homephone.ljust(15)
    end
  end

  def sort_result
    @sorted_results = @results.sort_by do |attendee|
      [attendee.send(@sort_criteria), attendee.last_name, attendee.first_name]
    end
  end

  def save(to_file="default.csv")
    @sort_criteria ||= 'last_name'
    sort result
    CSV.open(to_file, "w") do |row|
      row << [ "LAST_NAME",
        "FIRST_NAME",
        "EMAIL_ADDRESS",
        "ZIPCODE",
        "CITY",
        "STATE",
        "STREET",
        "HOMEPHONE" ]
      @sorted_results.each do |attendee|
        row << [ attendee.last_name,
          attendee.first_name,
          attendee.email_address,
          attendee.zipcode,
          attendee.city,
          attendee.state,
          attendee.street,
          attendee.homephone ]
      end
    end
  end
end
