require './lib/rotational_cipher'

class EnigmaBombe < RotationalCipher
  attr_reader :known_ending

  def initialize
    @known_ending = " end"
    super
  end

  def key(ciphertext, date)
    key = possible_keys(ciphertext, date).find do |key|
      key[0][1] == key[1][0] &&
      key[1][1] == key[2][0] &&
      key[2][1] == key[3][0]
    end
    format_key(key)
  end

  def format_key(key)
    key[0][0] + key[1][0] + key[2][0] + key[3]
  end

  def possible_keys(message, date)
    shifts = possible_shifts(message, date)
    shifts[:a].product(shifts[:b], shifts[:c], shifts[:d])
  end

  def possible_shifts(message, date)
    cracked_keys(message, date).reduce({}) do |possibilities, (letter, shift)|
      possibilities[letter] = shift_multiples(shift)
      possibilities
    end
  end

  def format_multiples(multiples)
    multiples.map do |multiple|
      multiple.to_s.rjust(2, "0")
    end
  end

  def shift_multiples(shift)
    multiples = (0..99).to_a.find_all do |number|
      (number - shift) % char_set.size == 0
    end
    format_multiples(multiples)
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
