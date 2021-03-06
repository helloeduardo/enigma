require './test/test_helper'
require './lib/rotational_cipher'

class RotationalCipherTest < Minitest::Test
  def setup
    @cipher = RotationalCipher.new
  end

  def test_it_exists
    assert_instance_of RotationalCipher, @cipher
  end

  def test_it_has_a_character_set
    expected = [
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
      'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
      's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '
    ]

    assert_equal expected, @cipher.char_set
  end

  def test_it_can_ceasar_translate
    expected = 'ifmmp'

    assert_equal expected, @cipher.ceasar_translate('Hello', 1)

    expected = 'ifmmp!'

    assert_equal expected, @cipher.ceasar_translate('Hello!', 1)
  end

  def test_it_can_vigenere_translate
    shifts = [3, 27, 73, 20]

    expected = 'keder ohulw'

    assert_equal expected, @cipher.vigenere_translate('hello world', shifts)
  end
end
