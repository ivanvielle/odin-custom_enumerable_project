module Enumerable
  # Your code goes here
  def my_all?
    my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_count
    return self.size unless block_given?

    correct_items = 0

    my_each do |item|
      if yield(item) 
        correct_items += 1
      end
    end

    correct_items
  end

  def my_each_with_index
    index = 0
    my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  # Not yet working
  def my_inject(accumulator)
    result = accumulator || first

    my_each do |item|
      result = yield(result, item)
    end

    result
  end

  def my_map
    result = []

    my_each do |item|
      result << yield(item)
    end

    result
  end

  def my_none?
    my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_select
    result = []

    my_each do |item|
      result << item if yield(item)
    end

    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable

  # Define my_each here
  def my_each
    i = 0

    while i < self.count
      yield(self[i])
      i += 1
    end

    self
  end
end
