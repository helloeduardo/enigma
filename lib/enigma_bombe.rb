class EnigmaBombe
  attr_reader :char_set, :known_ending

  def initialize
    @char_set = ("a".."z").to_a << " "
    @known_ending = " end"
  end
end
