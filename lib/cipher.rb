class Cipher
  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end
end
