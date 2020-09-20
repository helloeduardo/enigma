class RotationalCipher
  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def vigenere_translate(message, shifts)
    message.each_char.reduce("") do |new_message, char|
      new_message << ceasar_translate(char, shifts.first)
      shifts.rotate!
      new_message
    end
  end

  def ceasar_translate(message, shift)
    dictionary = char_set.zip(char_set.rotate(shift)).to_h

    message.downcase.chars.map do |char|
      if dictionary[char]
        dictionary[char]
      else
        char
      end
    end.join
  end
end
