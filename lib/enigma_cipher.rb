require './lib/rotational_cipher'
require './lib/offsetable'

# This class implements primary enigma cipher for encrytion and decryption
class EnigmaCipher < RotationalCipher
  include Offsetable
  attr_reader :message, :date, :key

  def initialize
    @message = ''
    @date = ''
    @key = ''
    super
  end

  def set_cipher(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  # Interface methods for encrypt and decrypt
  def encrypt(message, key, date)
    set_cipher(message, key, date)

    vigenere_translate(message, shifts.values)
  end

  def decrypt(message, key, date)
    set_cipher(message, key, date)

    vigenere_translate(message, shifts.values.map(&:-@))
  end

  # Helper methods for determining shifts
  def shifts
    keys.merge(offsets) do |_shift, subkey, offset|
      subkey + offset
    end
  end

  def keys
    { a: key[0..1].to_i,
      b: key[1..2].to_i,
      c: key[2..3].to_i,
      d: key[3..4].to_i }
  end
end
