require 'pry'
require 'csv'
require './lib/person'
require './lib/queue'


class Loader
  attr_reader :contents, :csv, :queue

  def initialize(file='./data/event_attendees.csv')
    @queue = []
    @contents = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def clean_first_name(data)
    data[:first_name].to_s.downcase.capitalize
  end

  def clean_last_name(data)
    data[:last_name].to_s.downcase.capitalize
  end

  def clean_city(data)
    data[:city].to_s.downcase.split.map(&:capitalize).join(' ')
  end

  def clean_street(data)
    data[:street].to_s.downcase.split.map(&:capitalize).join(' ')
  end

  def clean_state(data)
    data[:state].to_s.upcase
  end

  def clean_zipcode(data)
    data[:zipcode].to_s.rjust(5,"0")[0..4]
  end

  def clean_phone_numbers(data)
    @digits = data[:homephone].chars.grep(/\d/).join.rjust(10,"0")
    return "(%s) %s-%s" % [area_code, exchange, subscriber]
  end

   def area_code
     @digits[-10..-8]
   end

   def exchange
     @digits[-7..-5]
   end

   def subscriber
     @digits[-4..-1]
   end

  def clean_people
    @queue = []
    @contents.each do |row|
      regdate       = row[:regdate]
      first_name    = clean_first_name(row)
      last_name     = clean_last_name(row)
      email_address = row[:email_address]
      homephone     = clean_phone_numbers(row)
      street        = clean_street(row)
      city          = clean_city(row)
      state         = row[:state]
      zipcode       = clean_zipcode(row)

      @queue << Person.new(regdate, first_name, last_name, email_address, homephone, street, city, state, zipcode)
    end
  end

  def find_by(attribute, value)
    # Queue.new
    # @current_queue = []
    current_queue = @queue.select do |person|
      person[attribute] == value
    end
    Queue.build(current_queue)
  end

end

if __FILE__ == $0
  Loader.new.parse_test
end
