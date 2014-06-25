require "./test/test_helper"
require './lib/queue'
require './lib/attendee_repository'

class QueueTest < Minitest::Test
  def attendees
    @attendees = []
  end

  def test_it_exist
    queue = Queue.new(@attendees)
    assert Queue
  end

  def test_clear_erases_results
    queue = Queue.new(@attendees)
    queue.clear
    assert_equal [], queue.results
  end

  def test_it_finds_by_first_name
    repo = AttendeeRepository.new('./fake.csv').build_people
    queue = Queue.new(repo)
    queue.find(:first_name, "Paul")
    assert_equal ["Paul"], queue.results.to_s.scan(/Paul/)
  end

  def test_it_finds_by_last_name
    repo = AttendeeRepository.new('./fake.csv').build_people
    queue = Queue.new(repo)
    queue.find(:last_name, "Fulghum")
    assert_equal ["Fulghum"], queue.results.to_s.scan(/Fulghum/)
  end

  def test_it_finds_by_city
    repo = AttendeeRepository.new('./fake.csv').build_people
    queue = Queue.new(repo)
    queue.find(:city, "Tehran")
    assert_equal ["Tehran"], queue.results.to_s.scan(/Tehran/)
  end

  def test_it_finds_by_state
    repo = AttendeeRepository.new('./fake.csv').build_people
    queue = Queue.new(repo)
    queue.find(:state, "YK")
    assert_equal ["YK"], queue.results.to_s.scan(/YK/)
  end

  def test_it_finds_by_zipcode
    repo = AttendeeRepository.new('./fake.csv').build_people
    queue = Queue.new(repo)
    queue.find(:zipcode, "14517")
    assert_equal ["14517"], queue.results.to_s.scan(/14517/)
  end

  def test_it_counts_attendees
    repo = AttendeeRepository.new('./fake.csv').build_people
    queue = Queue.new(repo)
    queue.find(:zipcode, "14517")
    assert_equal 1, queue.results.count
  end
end
