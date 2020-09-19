require './test/test_helper'
require './lib/cipher'

class CipherTest < Minitest::Test

  def test_it_exists
    cipher = Cipher.new

    assert_instance_of Cipher, cipher
  end

  def test_it_has_a_character_set
    cipher = Cipher.new

    expected = [
      "a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r",
      "s", "t", "u", "v", "w", "x", "y", "z", " "
    ]

    assert_equal expected, cipher.char_set
  end

  def test_it_can_translate
    cipher = Cipher.new

    expected = 'ifmmp'

    assert_equal expected, cipher.translate('Hello', 1)

    expected = 'ifmmp!'

    assert_equal expected, cipher.translate('Hello!', 1)
  end

end
