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

  def test_it_can_find_keys
    cipher = Cipher.new

    expected = {
      a: 02,
      b: 27,
      c: 71,
      d: 15
    }

    assert_equal expected, cipher.keys("02715")
  end

  def test_it_can_find_offsets
    cipher = Cipher.new

    expected = {
      a: 1,
      b: 0,
      c: 2,
      d: 5
    }

    assert_equal expected, cipher.offsets("040895")
  end

  def test_it_can_find_shifts
    cipher = Cipher.new

    expected = {
      a: 3,
      b: 27,
      c: 73,
      d: 20
    }

    assert_equal expected, cipher.shifts("02715", "040895")
  end

  def test_it_can_encrypt_with_key_and_date
    cipher = Cipher.new

    expected = "keder ohulw"

    assert_equal expected, cipher.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_with_key_and_date
    cipher = Cipher.new

    expected = "hello world"

    assert_equal expected, cipher.decrypt("keder ohulw", "02715", "040895")
  end

end
