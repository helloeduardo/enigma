class EnigmaBombe
  attr_reader :char_set, :known_ending

  def initialize
    @char_set = ("a".."z").to_a << " "
    @known_ending = " end"
    @shifts = {}
  end

  def shift_sequence(message)
    message.each_char.with_index.map do |char, index|
      char_set[index % 4].to_sym
    end
  end

  def shifts(message)
    shift_sequence(message).last(4).zip(message_shifts(message)).sort.to_h
  end

  def message_shifts(ciphertext)
    ciphertext_last_chars = ciphertext.chars.last(4)

    #finds mininum or closest shifts
    known_ending.each_char.map do |char|
      shift = char_set.index(char) - char_set.index(ciphertext_last_chars.first)
      ciphertext_last_chars.rotate!
      shift
    end
  end

  def decrypt(ciphertext)
    shifts = shifts(ciphertext).values
    crypt(ciphertext, shifts)
  end

  #vigienere crypt, extractable to module?
  def crypt(message, shifts)
    message.each_char.reduce("") do |new_message, char|
      new_message << translate(char, shifts.first)
      shifts.rotate!
      new_message
    end
  end

  #rotational cipher knowledge
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
