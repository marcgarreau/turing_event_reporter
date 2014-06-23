require "./test/test_helper"
require './lib/queue'
require './lib/loader'

class QueueTest < Minitest::Test
  def test_it_exist
    Queue.build([{regdate: "11/16/08 20:20", first_name: "Paul", last_name: "Fulghum", email_address: "cnroh@jumpstartlab.com", homephone: "(000) 009-8200", street: "Shohadaye Sadeghiye", city: "Tehran", state: "YK", zipcode: "14517"}])
    assert Queue
  end

  def test_it_imports_a_current_queue
    Queue.build([{regdate: "11/16/08 20:20", first_name: "Paul", last_name: "Fulghum", email_address: "cnroh@jumpstartlab.com", homephone: "(000) 009-8200", street: "Shohadaye Sadeghiye", city: "Tehran", state: "YK", zipcode: "14517"}])
    assert_equal "Paul", Queue.current_queue.first[:first_name]
  end

  def test_that_clear_queue_clears_queue
    Queue.build([{regdate: "11/16/08 20:20", first_name: "Paul", last_name: "Fulghum", email_address: "cnroh@jumpstartlab.com", homephone: "(000) 009-8200", street: "Shohadaye Sadeghiye", city: "Tehran", state: "YK", zipcode: "14517"}])
    Queue.clear_queue
    assert_equal 0, Queue.current_queue.length
  end

  def test_that_queue_count_gives_count
    Queue.build([{regdate: "11/16/08 20:20", first_name: "Paul", last_name: "Fulghum", email_address: "cnroh@jumpstartlab.com", homephone: "(000) 009-8200", street: "Shohadaye Sadeghiye", city: "Tehran", state: "YK", zipcode: "14517"}])
    assert_equal 1, Queue.queue_count
  end

end
