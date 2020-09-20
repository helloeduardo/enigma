require './test/test_helper'
require './lib/enigma_bombe'

class EnigmaBombeTest < Minitest::Test

  def test_it_exists
    bombe = EnigmaBombe.new

    assert_instance_of EnigmaBombe, bombe
  end

  def test_it_has_a_character_set
    bombe = EnigmaBombe.new

    expected = [
      "a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r",
      "s", "t", "u", "v", "w", "x", "y", "z", " "
    ]

    assert_equal expected, bombe.char_set
  end

  def test_it_has_a_known_ending
    bombe = EnigmaBombe.new

    assert_equal " end", bombe.known_ending
  end

  def test_it_can_untranslate
    bombe = EnigmaBombe.new

    expected = "hello world end"

    assert_equal expected, bombe.untranslate("vjqtbeaweqihssi")
  end
end
