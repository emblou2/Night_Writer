require "pry"
require 'minitest/autorun'
require 'minitest/pride'
require "../lib/night_write.rb"

class NightWriteTest < Minitest::Test

  def test_braille_letter
    nw = NightWrite.new('y')
    assert_equal ["00", ".0", "00"], nw.translate_to_braille
  end



end
