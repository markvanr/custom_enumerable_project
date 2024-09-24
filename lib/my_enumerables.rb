module Enumerable
  def my_each_with_index
    i = 0
    my_each do |elem|
      yield elem, i
      i += 1
    end
  end

  def my_select
    selected = []
    my_each do |elem|
      selected << elem if yield elem
    end
    selected
  end

  def my_all?
    my_each {|elem| return false unless yield elem}
    true
  end

  def my_any?
    my_each {|elem| return true if yield elem}
    false
  end

  def my_none?
    my_each {|elem| return false if yield elem}
    true
  end

  def my_count
    return self.length unless block_given?

    total = 0
    my_each {|elem| total += 1 if yield elem}
    total
  end

  def my_map
    result = []
    my_each {|elem| result << (yield elem)} 
    result
  end

  def my_inject(memo=0)
    my_each {|elem| memo = yield(memo, elem)}
    memo
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield elem
    end
  end
end
