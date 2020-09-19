class Cipher
  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  #finding shifts
  def key_shifts(key)
    { a: key[0..1].to_i,
      b: key[1..2].to_i,
      c: key[2..3].to_i,
      d: key[3..4].to_i }
  end

  #rotational cipher methods
  def translate(string, shift)
    dictionary = char_set.zip(char_set.rotate(shift)).to_h

    string.downcase.chars.map do |char| #could just be a char
      if dictionary[char]
        dictionary[char]
      else
        char
      end
    end.join
  end

end
