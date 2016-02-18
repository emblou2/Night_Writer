#require "pry"
require_relative "file_read_write.rb"
class NightWrite

  attr_accessor :text, :topline, :midline, :botline

  def initialize(text)
    @text = text.chars
    @topline = []
    @midline = []
    @botline = []
  end

  def change_topline_to_braille_piece
    n = 1
    text.each {|l|
      if l ==('a')||l ==('b')||l ==('e')||l ==('h')||l ==('k')||l ==('l')||
        l ==('o')||l ==('r')||l ==('u')||l ==('v')||l ==('z')
        topline << "0."
      elsif l ==('c')||l ==('d')||l ==('f')||l ==('g')||l ==('m')||l ==('n')||
        l ==('p')||l ==('q')||l ==('x')||l ==('y')
        topline << "00"
      elsif l ==('i')||l ==('j')||l ==('s')||l ==('t')||l ==('w')
        topline << ".0"
      else
        topline << "#{l}#{l}"
      end
      n += 1
    }
  end

  def change_midline_to_braille_piece
    n = 1
    text.each {|l|
      if l ==('b')||l ==('f')||l ==('i')||l ==('l')||l ==('p')||l ==('s')||l ==('v')
        midline << "0."
      elsif l ==('g')||l ==('h')||l ==('j')||l ==('q')||l ==('r')||
        l ==('t')||l ==('w')
        midline << "00"
      elsif l ==('d')||l ==('e')||l ==('n')||l ==('o')||l ==('y')||
        l ==('z')
        midline << ".0"
      elsif l ==('a')||l ==('c')||l ==('k')||l ==('m')||l ==('u')||
        l ==('x')
        midline << ".."
      else
        midline << "#{l}#{l}"
      end
      n +=1
    }
  end

  def change_botline_to_braille_piece
    n = 1
    text.each {|l|
      if l ==('k')||l ==('l')||l ==('m')||l ==('n')||l ==('o')||l ==('p')||
      l ==('q')||l ==('r')||l ==('s')||l ==('t')
      botline << "0."
    elsif l ==('u')||l ==('v')||l ==('x')||l ==('y')||l ==('z')
      botline << "00"
    elsif l ==('a')||l ==('b')||l ==('d')||l ==('e')||l ==('f')||l ==('g')||
      l ==('h')||l ==('i')||l ==('j')
      botline << ".."
    else
      botline << "#{l}#{l}"
    end
    n +=1
  }
  end

  def output_braille
    change_topline_to_braille_piece
    change_midline_to_braille_piece
    change_botline_to_braille_piece
    return topline.join + "\n" + midline.join + "\n" + botline.join
  end

  def output_alpha

  end
end


if $PROGRAM_NAME == __FILE__
  input_file = ARGV[0]
  output_file = ARGV[1]
end

 nw = NightWrite.new("testing")
 braille = nw.output_braille
