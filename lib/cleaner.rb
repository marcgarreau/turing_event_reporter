class Cleaner

  # def initialize
  # end

  def first_name(data)
    data.to_s.downcase.capitalize
  end

  def last_name(data)
    data.to_s.downcase.capitalize
  end

  def city(data)
    data.to_s.downcase.split.map(&:capitalize).join(' ')
  end

  def street(data)
    data.to_s.downcase.split.map(&:capitalize).join(' ')
  end

  def state(data)
    data.to_s.upcase
  end

  def zipcode(data)
    data.to_s.rjust(5,"0")[0..4]
  end

  def homephone(data)
    @digits = data.chars.grep(/\d/).join.rjust(10,"0")
    return "(%s) %s-%s" % [area_code, exchange, subscriber]
  end

  private

  def area_code
    @digits[-10..-8]
  end

  def exchange
    @digits[-7..-5]
  end

  def subscriber
    @digits[-4..-1]
  end
end
