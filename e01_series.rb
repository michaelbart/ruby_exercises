# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that
# string.
#
# For example, the string "01234" has the following 3-digit series:
#   => 012
#   => 123
#   => 234
#
# And the following 4-digit series:
#   => 0123
#   => 1234

class Series
  attr_accessor :digits

  def initialize(digit_string)
    @digits = digit_string.chars.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError if num > digits.length

    # Using Enumerable#each_cons
    # digits.each_cons(num).to_a

    # Using my own implementation of the Enumerable#each_cons method
    if num == 1
      digits.map { |d| [d] }
    elsif num == digits.length
      [digits]
    else
      each_con(num)
    end
  end

  private

  def each_con(num)
    result = []
    count = 0
    while num <= digits.length
      result << digits.slice(count...num)
      num += 1
      count += 1
    end
    result
  end
end

# Discuss with instructor
def each_cons(num)
  return enum_for(:each_con, num) unless block_given?

  array = []
  each do |element|
    array << element
    array.shift if array.size > num
    yield array.dup if array.size == num
  end
end