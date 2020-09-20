require './lib/rotational_cipher'

class EnigmaBombe < RotationalCipher
  attr_reader :known_ending

  def initialize
    @known_ending = " end"
    super
  end

  def cracked_keys(message, date)
    shifts(message).merge(offsets(date)) do |letter, shift, offset|
      shift - offset
    end
  end

  def offsets(date)
    offsets = (date.to_i**2).digits.first(4)
    { a: offsets[3],
      b: offsets[2],
      c: offsets[1],
      d: offsets[0] }
  end

  def shifts(message)
    shift_sequence(message).last(4).zip(message_shifts(message)).sort.to_h
  end

  def shift_sequence(message)
    message.each_char.with_index.map do |char, index|
      char_set[index % 4].to_sym
    end
  end

  def message_shifts(ciphertext)
    last_chars = ciphertext.chars.last(4)

    known_ending.each_char.map do |char|
      shift = char_set.index(char) - char_set.index(last_chars.first)
      last_chars.rotate!
      -shift
    end
  end

  def decrypt(ciphertext)
    shifts = shifts(ciphertext).values.map { |n| -n }
    vigenere_translate(ciphertext, shifts)
  end

end
