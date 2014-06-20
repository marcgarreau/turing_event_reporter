require 'pry'
require 'csv'

class Loader
  attr_reader :contents, :csv, :queue

  def initialize(file='./data/fixtures/fake.csv')
    @queue = []
    @contents = CSV.open(file, headers: true, header_converters: :symbol)
  end

  # def cleaner(@contents)
    # clean_zipcode
    # clean_phone_numbers
    # clean_caps
  # end #returns a csv object(?)

  def clean_zipcode(data)
    data[:zipcode].to_s.rjust(5,"0")[0..4]
  end

  def clean_phone_numbers(data)
    @digits = data[:homephone].chars.grep(/\d/).join      #select("() .-E")
    return "(%s) %s-%s" % [area_code, exchange, subscriber]
  end

  #  def to_s
  #    "(%s) %s-%s" % [area_code, exchange, subscriber]
  #  end
   #
  #  def digits
  #    data[:phone_number].delete(".-() ")
  #  end

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
    @contents.each do |row|
      name = row[:first_name]
      puts name
      return name
    end  # Return a Queue instance?
  end

end

if __FILE__ == $0
  Loader.new.parse_test
end
