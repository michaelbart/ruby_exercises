# Write a program that can calculate the Hamming difference between two DNA strands.
#
# By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor,
# we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two 
# strands.
# 
# This is called the 'Hamming distance'
#
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
#
# The Hamming distance between these two DNA strands is 7.
#
# The Hamming distance is only defined for sequences of equal length. Hence you may assume that only sequences of equal length
# will be passed to your hamming distance function.

class DNA
  def initialize(strand)
    @strand = strand.chars
  end

  def hamming_distance(test_strand)
    strand = @strand.take(test_strand.length)
    strand.zip(test_strand.chars).count { |mutation| mutation.first != mutation.last }
  end
end