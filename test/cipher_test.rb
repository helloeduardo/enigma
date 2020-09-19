require './test/test_helper'
require './lib/cipher'

class CipherTest < Minitest::Test

  def test_it_exists
    cipher = Cipher.new

    assert_instance_of Cipher, cipher
  end

end
