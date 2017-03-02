# Write a program that can find the sum of all the multiples of particular numbers, up to but not including a given number.
#
# If we list all the natural numbers up to but not including 20, that are multiples of either 3 or 5, we get:
#   3, 5, 6, 9, 10, 12, 15, and 18. 
#   The sum of these multiples is 78.
#
# Write a program that can find the sum of the multiples of a given set of numbers. 
# If no set of numbers is given, default to 3 and 5.

class SumOfMultiples
  def initialize(*set)
    @set = set
  end

  def self.to(limit, set = [3, 5])
    (0...limit).select do |num|
      set.any? { |multiple| num % multiple == 0 }
    end.inject(:+)
  end

  def to(limit)
    SumOfMultiples.to(limit, @set)
  end
end