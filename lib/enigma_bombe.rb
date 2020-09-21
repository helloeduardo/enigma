require './lib/rotational_cipher'
require './lib/formatable'
require './lib/offsetable'

# This class cracks the enigma cipher
class EnigmaBombe < RotationalCipher
  include Formatable
  include Offsetable
  attr_reader :known_ending, :ciphertext, :date

  def initialize
    @known_ending = ' end'
    @ciphertext = ''
    @date = ''
    super
  end

  def set_bombe(ciphertext, date = '')
    @ciphertext = ciphertext
    @date = date
  end

  # Interface methods for crack and key
  def crack(ciphertext)
    set_bombe(ciphertext)

    vigenere_translate(@ciphertext, base_shifts.values.map(&:-@))
  end

  def key(ciphertext, date)
    set_bombe(ciphertext, date)

    find_key
  end

  # Helper methods to crack message
  def base_shifts
    shift_sequence.last(4).zip(message_shifts).sort.to_h
  end

  def shift_sequence
    ciphertext.each_char.with_index.map do |_char, index|
      char_set[index % 4].to_sym
    end
  end

  def message_shifts
    last_chars = ciphertext.chars.last(4)

    known_ending.each_char.map do |char|
      shift = char_set.index(char) - char_set.index(last_chars.first)
      last_chars.rotate!
      -shift
    end
  end

  # Helper methods to crack key
  def find_key
    keys = possible_keys.find do |key|
      key[0][1] == key[1][0] &&
        key[1][1] == key[2][0] &&
        key[2][1] == key[3][0]
    end
    format_key(keys)
  end

  def possible_keys
    shifts = possible_shifts
    shifts[:a].product(shifts[:b], shifts[:c], shifts[:d])
  end

  def possible_shifts
    base_keys.each_with_object({}) do |(letter, shift), possibilities|
      possibilities[letter] = shift_multiples(shift)
    end
  end

  def shift_multiples(shift)
    multiples = (0..99).to_a.find_all do |number|
      ((number - shift) % char_set.size).zero?
    end
    format_multiples(multiples)
  end

  def base_keys
    base_shifts.merge(offsets) do |_letter, shift, offset|
      shift - offset
    end
  end
end
