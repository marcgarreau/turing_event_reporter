require "./test/test_helper"
require './lib/queue'
require './lib/attendee_repository'

class QueueTest < Minitest::Test
  def test_it_exist
    queue = Queue.new
    assert Queue
  end

  def test_clear_erases_results
    queue = Queue.new
    queue.clear
    assert_equal [], queue.results
  end

  def test_it_finds__by_first_name
    queue = Queue.new
    queue.find_by_first_name("Haines")
    assert_equal 1, queue.results.count
  end

  def test_it_finds_by_last_name
    queue = Queue.new
    queue.find_by_last_name("Nguyen")
    assert_equal 3, queue.results.count
  end

  def test_it_finds_by_city
    queue = Queue.new
    queue.find_by_city("Purchase")
    assert_equal 12, queue.results.count
  end

  def test_it_finds_by_state
    queue = Queue.new
    queue.find_by_state("YK")
    assert_equal 27, queue.results.count
  end

  def test_it_finds_by_zipcode
    queue = Queue.new
    queue.find_by_zipcode("91326")
    assert_equal 1, queue.results.count
  end

  def test_it_counts_attendees
    queue = Queue.new
    queue.find_by_last_name("Nguyen")
    assert_equal 3, queue.count
  end

end
