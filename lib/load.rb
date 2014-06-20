require 'csv'
puts "fuck it! we'll do it live!"

contents = CSV.open './data/event_attendees.csv', headers: true, header_converters: :symbol
puts contents
