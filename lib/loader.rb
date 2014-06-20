require 'pry'
require 'csv'

class Loader
  attr_reader :contents, :csv

  def initialize(file='./data/fixtures/fake.csv')
    @contents = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def parse_master
    puts "fuck it! we'll do it live!"
    @contents.each do |row|
      name = row[:first_name]
      puts name
      return name
    end  # Return a Queue instance?
  end

end

if __FILE__ == $0
  Loader.new.parse_master
end
