require "./test/test_helper"
# require './lib/cleaner'
require './lib/attendee'

class CleanerTest < Minitest::Test

  # def test_it_cleans_zipcodes
  #   data = {zipcode: "7306"}
  #   Attendee.build(data)
  #   assert_equal "07306", cleaner.zipcode(data)
  # end
  #
  # def test_it_cleans_phone_numbers
  #   cleaner = Cleaner.new
  #   data = {homephone: "(321- )1231234"}
  #   assert_equal "(321) 123-1234", cleaner.clean_phone_numbers(data)
  # end
  #
  # def test_it_handles_garbage_phone_numbers
  #   cleaner = Cleaner.new
  #   data = {homephone: "9.82E+00"} #if not 10 digits, then rjust with 0's
  #   assert_equal "(000) 009-8200", cleaner.clean_phone_numbers(data)
  # end
  #
  # def test_it_cleans_first_names
  #   cleaner = Cleaner.new
  #   data = {first_name: "paul"}
  #   assert_equal "Paul", cleaner.first_name(data)
  # end
  #
  # def test_it_cleans_last_names
  #   cleaner = Cleaner.new
  #   data = {last_name: "fulghum"}
  #   assert_equal "Fulghum", cleaner.clean_last_name(data)
  # end
  #
  # def test_it_cleans_city
  #   cleaner = Cleaner.new
  #   data = {city: "DeNvEr"}
  #   assert_equal "Denver", cleaner.clean_city(data)
  # end
  #
  # def test_it_cleans_street
  #   cleaner = Cleaner.new
  #   data = {street: "1510 blakE st. uncw station"}
  #   assert_equal "1510 Blake St. Uncw Station", cleaner.clean_street(data)
  # end

end
