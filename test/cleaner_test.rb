require "./test/test_helper"

class CleanerTest < Minitest::Test

  def test_it_cleans_zipcodes
    cleaner = Cleaner.new
    assert_equal "07306", cleaner.zipcode("7306")
  end
  
  def test_it_cleans_phone_numbers
    cleaner = Cleaner.new
    assert_equal "(321) 123-1234", cleaner.homephone("(321- )1231234")
  end
  
  def test_it_handles_garbage_phone_numbers
    cleaner = Cleaner.new
    assert_equal "(000) 009-8200", cleaner.homephone("9.82E+00")
  end
  
  def test_it_cleans_first_names
    cleaner = Cleaner.new
    assert_equal "Paul", cleaner.first_name("paul")
  end
  
  def test_it_cleans_last_names
    cleaner = Cleaner.new
    assert_equal "Fulghum", cleaner.last_name("fulghum")
  end
  
  def test_it_cleans_city
    cleaner = Cleaner.new
    assert_equal "Denver", cleaner.city('dEnVeR')
  end
  
  def test_it_cleans_street
    cleaner = Cleaner.new
    assert_equal "1510 Blake St. Uncw Station", cleaner.street("1510 blakE st. uncw station")
  end

end
