class RotationalCipher
  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def crypt(message, shifts)
    message.each_char.reduce("") do |new_message, char|
      new_message << translate(char, shifts.first)
      shifts.rotate!
      new_message
    end
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
