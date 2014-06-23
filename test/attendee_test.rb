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

  def test_it_knows_its_data
  end
end
