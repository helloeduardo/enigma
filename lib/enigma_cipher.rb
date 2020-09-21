require './lib/rotational_cipher'

# This class implements primary enigma cipher for encrytion and decryption
class EnigmaCipher < RotationalCipher
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
    keys(key).merge(offsets(date)) do |_shift, subkey, offset|
      subkey + offset
    end
  end

  def encrypt(message, key, date)
    shifts = shifts(key, date).values
    vigenere_translate(message, shifts)
  end

  def decrypt(message, key, date)
    shifts = shifts(key, date).values.map(&:-@)
    vigenere_translate(message, shifts)
  end
end
