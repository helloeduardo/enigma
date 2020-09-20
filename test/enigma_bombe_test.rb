require './test/test_helper'
require './lib/enigma_bombe'

class EnigmaBombeTest < Minitest::Test

  def setup
    @bombe = EnigmaBombe.new
  end

  def test_it_exists
    assert_instance_of EnigmaBombe, @bombe
  end

  def test_it_has_a_character_set
    expected = [
      "a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r",
      "s", "t", "u", "v", "w", "x", "y", "z", " "
    ]

    assert_equal expected, @bombe.char_set
  end

  def test_it_has_a_known_ending
    assert_equal " end", @bombe.known_ending
  end

  def test_it_can_decrypt
    expected = "hello world end"

    assert_equal expected, @bombe.decrypt("vjqtbeaweqihssi")
  end

  def test_it_can_find_shift_sequence
    expected = [:a, :b, :c, :d, :a, :b, :c, :d, :a, :b, :c, :d, :a, :b, :c]

    assert_equal expected, @bombe.shift_sequence("vjqtbeaweqihssi")
  end

  def test_it_can_find_message_shifts
    expected = [19, -14, -5, -5]
    assert_equal expected, @bombe.message_shifts("vjqtbeaweqihssi")
  end

end
