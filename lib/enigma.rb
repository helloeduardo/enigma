require './lib/defaultable'

class Enigma
  include Defaultable

  def encrypt(message, key, date = default_date)
    { encryption: nil, #encrypted message method
      key: key,
      date: date }
  end

  def decrypt(ciphertext, key, date)
    { decryption: nil, #decrypted message method
      key: key,
      date: date }
  end
end
