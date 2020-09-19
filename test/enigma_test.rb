require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_with_key_and_date
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_with_key_and_date
    enigma = Enigma.new

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_with_key_and_default_date
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    Date.stubs(:today).returns(Date.new(1995, 8, 4))

    assert_equal "040895", enigma.default_date
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_with_key_and_default_date
    enigma = Enigma.new

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    Date.stubs(:today).returns(Date.new(1995, 8, 4))

    assert_equal "040895", enigma.default_date
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_with_default_key_and_default_date
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    enigma.stubs(:rand).returns(2715)
    Date.stubs(:today).returns(Date.new(1995, 8, 4))

    assert_equal "02715", enigma.default_key
    assert_equal "040895", enigma.default_date
    assert_equal expected, enigma.encrypt("hello world")
  end

end
