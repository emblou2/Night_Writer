
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/night_write.rb'

class NightWriteTest < Minitest::Test

  def test_braille_letter
    skip
    nw = NightWrite.new('y')
    output = nw.translate_to_braille
    assert_equal ["00", ".0", "00"], output
  end

  def test_braille_word
    nw = NightWrite.new('dog')
    out = nw.translate_to_braille
    assert_equal ["00",".0","..","0.",".0","0.","00","00"".."], out.output_three_lines('dog')
  end

  def test_braille_punctuation
    nw = NightWrite.new("!!")
    nw.translate_to_braille
    assert_equal ["..", "00", "0."], nw.output_three_lines
  end



end
