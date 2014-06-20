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
    assert_equal "Allison", loader.parse_master
  end


end
