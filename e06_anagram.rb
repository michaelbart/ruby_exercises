# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of
# the word.
# 
# For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should
# return a list containing "inlets"

class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    letters = @word.downcase.chars.sort
    list.reject! { |word| word =~ /#{@word}/i}
    list.select { |word| word.downcase.chars.sort == letters }.sort
  end
end