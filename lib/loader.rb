require 'pry'
require 'csv'

class Loader
  attr_reader :contents, :csv

  def initialize(file='./data/event_attendees.csv')
    @contents = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def meth
    puts "fuck it! we'll do it live!"
    @contents.each do |row|
      name = row[:first_name]
      puts name
    end
  end

end

if __FILE__ == $0
  Loader.new.meth
end
