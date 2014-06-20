gem 'minitest'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/loader'

class LoadTest < Minitest::Test

  def test_it_loads_a_file_by_default
    loader = Loader.new
    assert loader
  end

  def test_it_loads_a_custom_csv
    loader = Loader.new('./data/event_attendees2.csv')
    assert loader
  end

  def test_it_instatiates_unique_csvs
    loader = Loader.new
    loader2 = Loader.new('./data/event_attendees2.csv')
    refute_equal loader, loader2
  end

  def test_it_prints_rows
    loader = Loader.new('./data/fixtures/fake.csv')
    assert_equal "Allison", loader.parse_test
  end

  def test_it_cleans_zipcodes
    loader = Loader.new
    data = {zipcode: "7306"}
    assert_equal "07306", loader.clean_zipcode(data)
  end

  def test_it_cleans_phone_numbers
    loader = Loader.new
    data = {homephone: "(321- )1231234"}
    assert_equal "(321) 123-1234", loader.clean_phone_numbers(data)
  end


end
