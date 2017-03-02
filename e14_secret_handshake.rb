# There are 10 types of people in the world: Those who understand binary, and those who don't.
#
# You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".
#
#     1 = wink
#    10 = double blink
#   100 = close your eyes
#  1000 = jump
#
# 10000 = Reverse the order of the operations in the secret handshake.
#
# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]
#
# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
#
# The program should consider strings specifying an invalid binary as the value 0.

class SecretHandshake
  BINARY = [16, 8, 4, 2, 1]
  COMMANDS = ['jump', 'close your eyes', 'double blink', 'wink']

  def initialize(num)
    @num = num.to_i
    @binary = []
    @handshake = []
  end

  def commands
    self.convert(@num)
    @binary[1..4].each_with_index { |b, i| @handshake << COMMANDS[i] if b == 1 }
    return @handshake.reverse if @binary[0] == 0
    @handshake
  end

  def convert(num)
    BINARY.each_with_index do |bin_num, i|
      if num >= bin_num
        @binary << 1
        num -= bin_num
      else
        @binary << 0
      end
    end
    @binary
  end
end