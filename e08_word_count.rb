# Write a program that given a phrase can count the occurrences of each word in that phrase.

# For example, if we count the words for the input "olly olly in come free", we should get:
#   olly: 2
#     in: 1
#   come: 1
#   free: 1

class Phrase
  def initialize(string)
    @phrase = string.scan(/\b[\w']+\b/) 
  end
  
  def word_count
    counts = Hash.new(0)
    @phrase.each { |word| counts[word.downcase] += 1 }
    counts
  end
end