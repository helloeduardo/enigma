require './lib/rotational_cipher'
require './lib/offsetable'

# This class implements primary enigma cipher for encrytion and decryption
class EnigmaCipher < RotationalCipher
  include Offsetable

  def encrypt(message, key, date)
    shifts = shifts(key, date).values
    vigenere_translate(message, shifts)
  end

  def decrypt(message, key, date)
    shifts = shifts(key, date).values.map(&:-@)
    vigenere_translate(message, shifts)
  end

  def shifts(key, date)
    keys(key).merge(offsets(date)) do |_shift, subkey, offset|
      subkey + offset
    end
  end

  def keys(key)
    { a: key[0..1].to_i,
      b: key[1..2].to_i,
      c: key[2..3].to_i,
      d: key[3..4].to_i }
  end
end
