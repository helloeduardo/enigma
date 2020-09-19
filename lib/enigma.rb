require './lib/defaultable'

class Enigma
  include Defaultable

  def encrypt(message, key, date)
    { encryption: nil, #encrypted message method
      key: key,
      date: date }
  end
end
