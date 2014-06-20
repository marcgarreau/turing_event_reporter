gem 'minitest'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/load'

class LoadTest < Minitest::Test

  def test_it_loads
    loader = Load.new
    assert loader
  end

end
