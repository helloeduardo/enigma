class Cipher
  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  #finding shifts
  def keys(key)
    { a: key[0..1].to_i,
      b: key[1..2].to_i,
      c: key[2..3].to_i,
      d: key[3..4].to_i }
  end

  def offsets(date)
    offsets = (date.to_i**2).digits.first(4)
    { a: offsets[3],
      b: offsets[2],
      c: offsets[1],
      d: offsets[0] }
  end

  def shifts(key, date)
    keys(key).merge(offsets(date)) do |shift, key, offset|
      key + offset
    end
  end

  def encrypt(message, key, date)
    shifts = shifts(key, date).values

    message.each_char.reduce("") do |new_message, char|
      new_message << translate(char, shifts[0])
      shifts.rotate!(1)
      new_message
    end
  end

  def decrypt(message, key, date)
    shifts = shifts(key, date).values.map { |n| -n }

    message.each_char.reduce("") do |new_message, char|
      new_message << translate(char, shifts[0])
      shifts.rotate!(1)
      new_message
    end
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
