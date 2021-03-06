require './test/test_helper'
require './lib/enigma_bombe'

class EnigmaBombeTest < Minitest::Test
  def setup
    @bombe = EnigmaBombe.new
    @bombe.set_bombe('vjqtbeaweqihssi', '291018')
  end

  def test_it_exists
    assert_instance_of EnigmaBombe, @bombe
  end

  def test_it_has_a_known_ending
    assert_equal ' end', @bombe.known_ending
  end

  def test_it_has_a_ciphertext_and_date
    assert_equal 'vjqtbeaweqihssi', @bombe.ciphertext
    assert_equal '291018', @bombe.date
  end

  def test_it_can_crack
    assert_equal 'hello world end', @bombe.crack('vjqtbeaweqihssi')
  end

  def test_it_has_key
    assert_equal '08304', @bombe.key('vjqtbeaweqihssi', '291018')
  end

  def test_it_can_find_base_shifts
    expected = {
      a: 14,
      b: 5,
      c: 5,
      d: -19
    }
    assert_equal expected, @bombe.base_shifts
  end

  def test_it_can_find_shift_sequence
    expected = [:a, :b, :c, :d, :a, :b, :c, :d, :a, :b, :c, :d, :a, :b, :c]

    assert_equal expected, @bombe.shift_sequence
  end

  def test_it_can_find_message_shifts
    expected = [-19, 14, 5, 5]
    assert_equal expected, @bombe.message_shifts
  end

  def test_it_can_find_key
    assert_equal '08304', @bombe.find_key
  end

  def test_it_can_have_possible_keys
    assert_equal 256, @bombe.possible_keys.count
  end

  def test_it_can_have_possible_shifts
    expected = {
      a: ['08', '35', '62', '89'],
      b: ['02', '29', '56', '83'],
      c: ['03', '30', '57', '84'],
      d: ['04', '31', '58', '85']
    }

    assert_equal expected, @bombe.possible_shifts
  end

  def test_it_can_find_shift_multiples
    assert_equal ['08', '35', '62', '89'], @bombe.shift_multiples(8)
  end

  def test_it_can_find_base_keys
    expected = {
      a: 8,
      b: 2,
      c: 3,
      d: -23
    }

    assert_equal expected, @bombe.base_keys
  end

  # From modules

  def test_it_can_format_key
    assert_equal '08304', @bombe.format_key(['08', '83', '30', '04'])
  end

  def test_it_can_format_multiples
    assert_equal ['08', '35', '62', '89'], @bombe.format_multiples([8, 35, 62, 89])
  end

  def test_it_can_find_offsets
    expected = {
      a: 6,
      b: 3,
      c: 2,
      d: 4
    }

    assert_equal expected, @bombe.offsets
  end

  # From inheritance

  def test_it_has_a_character_set
    expected = [
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
      'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
      's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '
    ]

    assert_equal expected, @bombe.char_set
  end
end
