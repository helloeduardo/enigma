require './lib/defaultable'

class Enigma
  include Defaultable
  attr_reader :cipher, :bombe

  def initialize
    @cipher = EnigmaCipher.new
    @bombe = EnigmaBombe.new
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
    { decryption: bombe.decrypt(ciphertext),
      date: date,
      key: nil } #crack message key method
  end
end
