require "./test/test_helper"

class AttendeeTest < Minitest::Test
  def test_it_exists
    assert Attendee
  end

  def data
    {
      regdate: "Date",
      first_name: "Laura",
      last_name: "Smith",
      email_address: "la@smith.com",
      homephone: "(312) 123-1234",
      street: "1231 Something St",
      city: "Orlando",
      state: "FL",
      zipcode: "31123"
    }
  end

  def test_it_has_attributes
    result = Attendee.build(data)

    assert result.regdate
    assert result.first_name
    assert result.last_name
    assert result.email_address
    assert result.homephone
    assert result.street
    assert result.city
    assert result.state
    assert result.zipcode
  end

  def test_it_knows_its_zip
    result = Attendee.build(data)
    assert result.zipcode =~ /31123/
  end
  
  def test_it_knows_its_first_name
    result = Attendee.build(data)
    assert result.first_name =~ /Laura/
  end
  
  def test_it_knows_its_last_name
    result = Attendee.build(data)
    assert result.last_name =~ /Smith/
  end
  
  def test_it_knows_its_email
    result = Attendee.build(data)
    assert result.email_address =~ /la@smith.com/
  end
  
  def test_it_knows_its_home_phone
    result = Attendee.build(data)
    assert result.homephone =~ /123-1234/
  end
  
  def test_it_knows_its_adress
    result = Attendee.build(data)
    assert result.street =~ /Something/
  end
  
  def test_it_knows_its_city
    result = Attendee.build(data)
    assert result.city =~ /Orlando/
  end
  
  def test_it_knows_its_state
    result = Attendee.build(data)
    assert result.state =~ /FL/
  end
end
