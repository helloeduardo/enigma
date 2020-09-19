require './lib/defaultable'

class Enigma
  include Defaultable
  attr_reader :cipher

  def initialize
    @cipher = EnigmaCipher.new
  end

  def encrypt(message, key = default_key, date = default_date)
    { encryption: cipher.encrypt(message, key, date),
      key: key,
      date: date }
  end

  def decrypt(ciphertext, key, date = default_date)
    { decryption: cipher.decrypt(ciphertext, key, date),
      key: key,
      date: date }
  end

  def crack(ciphertext, date = default_date)
    { decryption: nil, #crack message method
      date: date,
      key: nil } #crack message key method
  end
end
