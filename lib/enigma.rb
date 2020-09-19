require './lib/defaultable'

class Enigma
  include Defaultable

  def encrypt(message, key = default_key, date = default_date)
    { encryption: nil, #encrypted message method
      key: key,
      date: date }
  end

  def decrypt(ciphertext, key, date = default_date)
    { decryption: nil, #decrypted message method
      key: key,
      date: date }
  end

  def crack(ciphertext, date)
    { decryption: nil, #crack message method
      date: date,
      key: nil } #crack message key method
  end
end
