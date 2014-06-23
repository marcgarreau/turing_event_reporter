require "./test/test_helper"
require './lib/queue'
require './lib/attendee_repository'

class AttendeeRepositoryTest < Minitest::Test

  def test_it_loads_a_file_by_default
    repo = AttendeeRepository.new
    assert repo
  end

  def test_it_loads_a_custom_csv
    repo = AttendeeRepository.new('./data/event_attendees2.csv')
    assert repo
  end

  def test_it_instatiates_unique_csvs
    loader = AttendeeRepository.new
    loader2 = AttendeeRepository.new('./data/event_attendees2.csv')
    refute_equal loader, loader2
  end

  def test_it_populates_records_with_attendees_hash
    repo = AttendeeRepository.new
    attendees = repo.build_people
    assert_equal Array, attendees.class
  end
  #
  # def test_parse_method_creates_a_person_object
  #   loader = Loader.new('./data/fixtures/fake.csv')
  #   loader.clean_people
  #   assert_equal 1, loader.queue.length
  # end
  #
  # def test_find_by_first_name
  #   loader = Loader.new('./data/fixtures/fake.csv')
  #   loader.clean_people
  #   selected = loader.find_by(:first_name, "Paul")
  #   assert_equal "Paul", Queue.current_queue.first[:first_name]
  # end
  #
  # def test_find_by_last_name
  #   # skip
  #   loader = Loader.new('./data/fixtures/fake.csv')
  #   loader.clean_people
  #   selected = loader.find_by(:last_name, "Fulghum")
  #   assert_equal "Fulghum", Queue.current_queue.first[:last_name]
  # end
end
