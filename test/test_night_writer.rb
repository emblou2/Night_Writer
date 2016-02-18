require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/night_write.rb'

class NightWriteTest < Minitest::Test


  def test_one_braille_letter_topline
    nw = NightWrite.new('a')
    nw.output_braille
    assert_equal ['0.'], nw.topline
  end

  def test_one_braille_letter_midline
    nw = NightWrite.new('x')
    nw.output_braille
    assert_equal ['..'], nw.midline
  end

  def test_one_braille_letter_botline
    nw = NightWrite.new('s')
    nw.output_braille
    assert_equal ['0.'], nw.botline
  end

  def test_braille_letter_for_all_lines
    nw = NightWrite.new('y')
    nw.output_braille
    assert_equal ['00'], nw.topline
    assert_equal ['.0'], nw.midline
    assert_equal ['00'], nw.botline
  end

  def test_more_than_one_alpha_letter
    nw = NightWrite.new('dog')
    nw.output_braille
    assert_equal ("000.00"), nw.topline.join
    assert_equal (".0.000"), nw.midline.join
    assert_equal ("..0..."), nw.botline.join
  end


end
