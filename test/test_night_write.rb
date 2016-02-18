#require "pry"
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true

require_relative "../lib/night_write.rb"  # => true

class NightWriteTest < Minitest::Test  # => Minitest::Test


  def test_one_braille_letter_topline
    nw = NightWrite.new('a')           # => #<NightWrite:0x007f8a220b9100 @text=["a"], @topline=[], @midline=[], @botline=[]>
    nw.output_braille                  # => "0.\n..\n.."
    assert_equal ['0.'], nw.topline    # => true
  end                                  # => :test_one_braille_letter_topline

  def test_one_braille_letter_midline
    nw = NightWrite.new('x')           # => #<NightWrite:0x007f8a220ab460 @text=["x"], @topline=[], @midline=[], @botline=[]>
    nw.output_braille                  # => "00\n..\n00"
    assert_equal ['..'], nw.midline    # => true
  end                                  # => :test_one_braille_letter_midline

  def test_one_braille_letter_botline
    nw = NightWrite.new('s')           # => #<NightWrite:0x007f8a220ba398 @text=["s"], @topline=[], @midline=[], @botline=[]>
    nw.output_braille                  # => ".0\n0.\n0."
    assert_equal ['0.'], nw.botline    # => true
  end                                  # => :test_one_braille_letter_botline

  def test_braille_letter_for_all_lines
    nw = NightWrite.new('y')             # => #<NightWrite:0x007f8a220bbd88 @text=["y"], @topline=[], @midline=[], @botline=[]>
    nw.output_braille                    # => "00\n.0\n00"
    assert_equal ['00'], nw.topline      # => true
    assert_equal ['.0'], nw.midline      # => true
    assert_equal ['00'], nw.botline      # => true
  end                                    # => :test_braille_letter_for_all_lines

  def test_more_than_one_alpha_letter
    nw = NightWrite.new('dog')                # => #<NightWrite:0x007f8a220a9e80 @text=["d", "o", "g"], @topline=[], @midline=[], @botline=[]>
    nw.output_braille                         # => "000.00\n.0.000\n..0..."
    assert_equal ('000.00'), nw.topline.join  # => true
    assert_equal ('.0.000'), nw.midline.join  # => true
    assert_equal ('..0...'), nw.botline.join  # => true
  end                                         # => :test_more_than_one_alpha_letter

  def test_word_longer_than_three_letters
    nw = NightWrite.new('play')                 # => #<NightWrite:0x007f8a2108fd38 @text=["p", "l", "a", "y"], @topline=[], @midline=[], @botline=[]>
    nw.output_braille                           # => "000.0.00\n0.0....0\n0.0...00"
    assert_equal ('000.0.00'), nw.topline.join  # => true
    assert_equal ('0.0....0'), nw.midline.join  # => true
    assert_equal ('0.0...00'), nw.botline.join  # => true
  end                                           # => :test_word_longer_than_three_letters

  def test_it_works_with_two_words
    nw = NightWrite.new('two words')                    # => #<NightWrite:0x007f8a2109e5b8 @text=["t", "w", "o", " ", "w", "o", "r", "d", "s"], @topline=[], @midline=[], @botline=[]>
    nw.output_braille                                   # => ".0.00.  .00.0.00.0\n0000.0  00.000.00.\n0.ww0.  ww0.0...0."
    assert_equal ('.0.00.  .00.0.00.0'), nw.topline.join
  end                                                   # => :test_it_works_with_two_words


end  # => :test_it_works_with_two_words

# >> Run options: --seed 16532
# >>
# >> # Running:
# >>
# >> \e[31m*\e[0m\e[32m*\e[0m\e[41m\e[37mF\e[0m\e[33m*\e[0m\e[34m*\e[0m\e[35m*\e[0m\e[36m*\e[0m
# >>
# >> \e[31mF\e[0m\e[32ma\e[0m\e[33mb\e[0m\e[34mu\e[0m\e[35ml\e[0m\e[36mo\e[0m\e[31mu\e[0m\e[32ms\e[0m\e[33m \e[0m\e[34mr\e[0m\e[35mu\e[0m\e[36mn\e[0m in 0.001483s, 4720.1618 runs/s, 8766.0148 assertions/s.
# >>
# >>   1) Failure:
# >> NightWriteTest#test_it_works_with_two_words [/Users/emilyblanchard/turing/1module/projects/night_writer/test/test_night_write.rb:55]:
# >> Expected: ".0.00.  .00.0.00"
# >>   Actual: ".0.00.  .00.0.00.0"
# >>
# >> 7 runs, 13 assertions, 1 failures, 0 errors, 0 skips
