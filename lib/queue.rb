require './lib/attendee_repository'

class Queue
  attr_reader :results, :attendees

  def intialize
    @attendees = AttendeeRepository.new.build_people
    @results   = []
  end

  def find_by_first_name(value)
    @results << attendees.select { |attendee| attendee.first_name == value }
  end

  def clear
    @results = []
  end

  # def self.build(current_queue)
  #   @current_queue = current_queue
  #   new(current_queue)
  # end
  #
  # def initialize(current_queue)
  #   # @current_queue = current_queue
  # end
  #
  # def self.current_queue
  #   @current_queue
  # end
  #
  # def self.clear_queue
  #   @current_queue = []
  # end
  #
  # def self.queue_count
  #   @current_queue.length
  # end
  #
  # def queue_save
  #
  #
  # end
  #
  # def self.queue_print
  #   puts "LAST NAME".ljust(15) +
  #     "FIRST NAME".ljust(15) +
  #     "EMAIL".ljust(40) +
  #     "ZIPCODE".ljust(10) +
  #     "CITY".ljust(15) +
  #     "STATE".ljust(10) +
  #     "ADDRESS".ljust(30) +
  #     "PHONE".ljust(15)
  #   @current_queue.each do |person|
  #     puts person[:last_name].ljust(15) +
  #       person[:first_name].ljust(15) +
  #       person[:email_address].ljust(40) +
  #       person[:zipcode].ljust(10) +
  #       person[:city].ljust(15) +
  #       person[:state].ljust(10) +
  #       person[:street].ljust(30) +
  #       person[:homephone].ljust(15)
  #   end
  # end

end
