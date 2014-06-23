require 'pry'
require 'csv'
require './lib/person'

class Loader
  attr_reader :contents, :csv, :queue

  def initialize(file='./data/event_attendees.csv')
    @queue = []
    @contents = CSV.open(file, headers: true, header_converters: :symbol)
  end

  # def cleaner(contents)
  #   clean_zipcode(contents)
  #   clean_phone_numbers(contents) #add a new class?
  #   clean_first_name(contents)
  #   clean_last_name(contents)
  #   clean_city(contents)
  #   clean_street(contents)
  # end #returns a csv object(?)

  def clean_first_name(data)
    data[:first_name].downcase.capitalize
  end

  def clean_last_name(data)
    data[:last_name].downcase.capitalize
  end

  def clean_city(data)
    data[:city].downcase.capitalize
  end

  def clean_street(data)
    data[:street].downcase.capitalize
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

  def parse_test
    puts "fuck it! we'll do it live!"
    @queue = []
    @contents.each do |row|
      first_name = clean_first_name(row)
      last_name = clean_last_name(row)
      city = clean_city(row)

      puts "#{first_name} #{last_name} #{city}"

      person = {first_name: first_name, last_name: last_name, city: city}
      @queue << Person.new(first_name, last_name, city)
    end
    puts @queue
  end

  def find_by(attribute, value)
    selected = @queue.select do |person|
      person[attribute] == value
    end
    return selected
  end

end

if __FILE__ == $0
  Loader.new.parse_test
end
