require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/night_write.rb'

class NightWriteTest < Minitest::Test


  def test_one_letter_to_braille
    assert_equal "0.....", NightWrite.letter_to_braille('a')
    assert_equal "0.0...", NightWrite.letter_to_braille('b')
    assert_equal "0..000", NightWrite.letter_to_braille('z')
  end


end
