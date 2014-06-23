require './lib/cleaner'

class Attendee
  def self.build(data)
    cleaner = Cleaner.new
    new(data, cleaner)
  end

  attr_reader :regdate,
              :first_name,
              :last_name,
              :email_address,
              :homephone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data, cleaner)
    @regdate       = data[:regdate]
    @first_name    = cleaner.first_name(data[:first_name])
    @last_name     = cleaner.last_name(data[:last_name])
    @email_address = data[:email_address]
    @homephone     = cleaner.homephone(data[:homephone])
    @street        = cleaner.street(data[:street])
    @city          = cleaner.city(data[:city])
    @state         = cleaner.state(data[:state])
    @zipcode       = cleaner.zipcode(data[:zipcode])
  end
end
