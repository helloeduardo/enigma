class Cipher
  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  #finding shifts

  #rotational cipher methods
  def translate(string, shift)
    dictionary = char_set.zip(char_set.rotate(shift)).to_h
    string.downcase.chars.map do |char|
      dictionary[char]
    end.join
  end


end
