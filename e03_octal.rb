# Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output.
#   The rightmost digit gets multiplied by 100 = 1
#   The next number gets multiplied by 101 = 10
#   ...
#   The n*th number gets multiplied by 10n-1*.
#   All these values are summed.

class Octal
  BASE = 8
  INVALID = /\D|[8-9]/   # any non-digit or 8 or 9

  attr_reader :octal_string

  def initialize(string)
    @octal_string = string
  end

  def to_decimal
    # unless string contains invalid chars, calculate
    octal_string =~ INVALID ? 0 : calculate
  end

  private

  def calculate
    decimal = 0
    # reverse to calculate right to left
    octal_string.reverse.each_char.with_index do |char, index|
      # find the sum of: each digit multiplied by 8 to the power of the index
      decimal += char.to_i * (BASE ** index)
    end
    decimal
  end
end