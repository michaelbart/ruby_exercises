# Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its decimal equivalent using
# first principles (without using an existing method or library that can work with numeral systems).
#
# Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should convert to decimal number 0.
#
# The last place in a trinary number is the 1's place,
#   the second to last is the 3's place, 
#   the third to last is the 9's place, etc.
#
# "102012"
#     1       0       2       0       1       2    # the number
# 1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
#   243 +     0 +    54 +     0 +     3 +     2 =  302

class Trinary
  def initialize(trinary_str)
    @trinary = trinary_str =~ /\D/ ? [0] : trinary_str.reverse.chars.map(&:to_i)
  end
  
  def to_decimal
    sum = 0
    @trinary.each_with_index do |char, index|
      sum += self.calculate_value(char, index)
    end
    sum
  end

  def calculate_value(num,power)
    value = num * (3 ** power)
    value
  end
end