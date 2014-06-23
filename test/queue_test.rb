require "./test/test_helper"
require './lib/queue'
require './lib/loader'

class QueueTest < Minitest::Test
  def test_it_exist
    queue = Queue.new([{regdate: "11/16/08 20:20", first_name: "Paul", last_name: "Fulghum", email_address: "cnroh@jumpstartlab.com", homephone: "(000) 009-8200", street: "Shohadaye Sadeghiye", city: "Tehran", state: "YK", zipcode: "14517"}])
    assert queue
  end

  def test_it_imports_a_current_queue
    queue = Queue.new([{regdate: "11/16/08 20:20", first_name: "Paul", last_name: "Fulghum", email_address: "cnroh@jumpstartlab.com", homephone: "(000) 009-8200", street: "Shohadaye Sadeghiye", city: "Tehran", state: "YK", zipcode: "14517"}])
    assert_equal "Paul", queue.current_queue.first[:first_name]
  end

  def test_that_clear_queue_clears_queue
    queue = Queue.new([{regdate: "11/16/08 20:20", first_name: "Paul", last_name: "Fulghum", email_address: "cnroh@jumpstartlab.com", homephone: "(000) 009-8200", street: "Shohadaye Sadeghiye", city: "Tehran", state: "YK", zipcode: "14517"}])
    queue.clear_queue
    assert_equal [], queue.current_queue
  end

  def test_that_queue_count_gives_count
    queue = Queue.new([{regdate: "11/16/08 20:20", first_name: "Paul", last_name: "Fulghum", email_address: "cnroh@jumpstartlab.com", homephone: "(000) 009-8200", street: "Shohadaye Sadeghiye", city: "Tehran", state: "YK", zipcode: "14517"}])
    assert_equal 1, queue.queue_count
  end

end
