require './test/test_helper'
require './lib/enigma_cipher'

class EnigmaCipherTest < Minitest::Test
  def setup
    @cipher = EnigmaCipher.new
    @cipher.set_cipher('hello world', '02715', '040895')
  end

  def test_it_exists
    assert_instance_of EnigmaCipher, @cipher
  end

  def test_it_has_a_character_set
    expected = [
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
      'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
      's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '
    ]

    assert_equal expected, @cipher.char_set
  end

  def test_it_can_set_cipher
    @cipher.set_cipher('hello world', '02715', '040895')
    assert_equal 'hello world', @cipher.message
    assert_equal '02715', @cipher.key
    assert_equal '040895', @cipher.date
  end

  def test_it_can_find_keys
    expected = {
      a: 2,
      b: 27,
      c: 71,
      d: 15
    }

    assert_equal expected, @cipher.keys
  end

  def test_it_can_find_offsets
    expected = {
      a: 1,
      b: 0,
      c: 2,
      d: 5
    }

    assert_equal expected, @cipher.offsets
  end

  def test_it_can_find_shifts
    expected = {
      a: 3,
      b: 27,
      c: 73,
      d: 20
    }

    assert_equal expected, @cipher.shifts
  end

  def test_it_can_encrypt_with_key_and_date
    expected = 'keder ohulw'

    assert_equal expected, @cipher.encrypt('hello world', '02715', '040895')
  end

  def test_it_can_decrypt_with_key_and_date
    @cipher.stubs(:message).returns('keder ohulw')

    expected = 'hello world'

    assert_equal expected, @cipher.decrypt('keder ohulw', '02715', '040895')
  end

  def test_it_can_crypt
    shifts = [3, 27, 73, 20]

    expected = 'keder ohulw'

    assert_equal expected, @cipher.vigenere_translate('hello world', shifts)
  end
end
