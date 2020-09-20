require './test/test_helper'
require './lib/enigma_bombe'

class EnigmaBombeTest < Minitest::Test

  def test_it_exists
    bombe = EnigmaBombe.new

    assert_instance_of EnigmaBombe, bombe
  end
end
