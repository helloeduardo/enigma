class RotationalCipher
  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def translate(string, shift)
    dictionary = char_set.zip(char_set.rotate(shift)).to_h

    string.downcase.chars.map do |char|
      if dictionary[char]
        dictionary[char]
      else
        char
      end
    end.join
  end
end
