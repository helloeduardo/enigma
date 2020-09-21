require './test/test_helper'
require './lib/enigma'
require './lib/enigma_cipher'
require './lib/enigma_bombe'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Enigma, @enigma
    assert_instance_of EnigmaCipher, @enigma.cipher
  end

  def test_it_can_encrypt_with_key_and_date
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, @enigma.encrypt('hello world', '02715', '040895')
  end

  def test_it_can_decrypt_with_key_and_date
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, @enigma.decrypt('keder ohulw', '02715', '040895')
  end

  def test_it_can_encrypt_with_key_and_default_date
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }

    Date.stubs(:today).returns(Date.new(1995, 8, 4))

    assert_equal '040895', @enigma.default_date
    assert_equal expected, @enigma.encrypt('hello world', '02715')
  end

  def test_it_can_decrypt_with_key_and_default_date
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }

    Date.stubs(:today).returns(Date.new(1995, 8, 4))

    assert_equal '040895', @enigma.default_date
    assert_equal expected, @enigma.decrypt('keder ohulw', '02715', '040895')
  end

  def test_it_can_encrypt_with_default_key_and_default_date
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }

    @enigma.stubs(:rand).returns(2715)
    Date.stubs(:today).returns(Date.new(1995, 8, 4))

    assert_equal '02715', @enigma.default_key
    assert_equal '040895', @enigma.default_date
    assert_equal expected, @enigma.encrypt('hello world')
  end

  def test_it_can_crack_with_date
    expected = {
      decryption: 'hello world end',
      date: '291018',
      key: '08304'
    }

    assert_equal expected, @enigma.crack('vjqtbeaweqihssi', '291018')
  end

  def test_it_can_crack_with_default_date
    expected = {
      decryption: 'hello world end',
      date: '291018',
      key: '08304'
    }

    Date.stubs(:today).returns(Date.new(2018, 10, 29))

    assert_equal '291018', @enigma.default_date
    assert_equal expected, @enigma.crack('vjqtbeaweqihssi')
  end
end
