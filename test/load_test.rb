gem 'minitest'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/load'

class LoadTest < Minitest::Test

  def test_it_loads_a_file_by_default
    loader = Load.new
    assert loader
  end

  def test_it_loads_a_custom_csv
    loader = Load.new('./data/event_attendees2.csv')
    assert loader
  end

  def test_it_instatiates_unique_csvs
    loader = Load.new
    loader2 = Load.new('./data/event_attendees2.csv')
    refute_equal loader, loader2
  end

  
end
