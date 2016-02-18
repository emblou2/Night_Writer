#require "pry"
class NightWrite

  attr_accessor :text, :topline, :midline, :botline  # => nil

  def initialize(text)
    @text = text.chars  # => ["t", "e", "s", "t", "i", "n", "g"]
    @topline = []       # => []
    @midline = []       # => []
    @botline = []       # => []
  end                   # => :initialize

  def change_topline_to_braille_piece
    n = 1                                                                       # => 1
    #text
    text.each {|l|                                                              # => ["t", "e", "s", "t", "i", "n", "g"]
      if l ==('a')||l ==('b')||l ==('e')||l ==('h')||l ==('k')||l ==('l')||     # => false, true, false, false, false, false, false
        l ==('o')||l ==('r')||l ==('u')||l ==('v')||l ==('z')                   # => false, true, false, false, false, false, false
        topline << "0."                                                         # => [".0", "0."]
      elsif l ==('c')||l ==('d')||l ==('f')||l ==('g')||l ==('m')||l ==('n')||  # => false, false, false, false, true, true
        l ==('p')||l ==('q')||l ==('x')||l ==('y')                              # => false, false, false, false, true, true
        topline << "00"                                                         # => [".0", "0.", ".0", ".0", ".0", "00"], [".0", "0.", ".0", ".0", ".0", "00", "00"]
      elsif l ==('i')||l ==('j')||l ==('s')||l ==('t')||l ==('w')               # => true, true, true, true
        topline << ".0"                                                         # => [".0"], [".0", "0.", ".0"], [".0", "0.", ".0", ".0"], [".0", "0.", ".0", ".0", ".0"]
      else
        topline << "#{l}#{l}"
      end                                                                       # => [".0"], [".0", "0."], [".0", "0.", ".0"], [".0", "0.", ".0", ".0"], [".0", "0.", ".0", ".0", ".0"], [".0", "0.", ".0", ".0", ".0", "00"], [".0", "0.", ".0", ".0", ".0", "00", "00"]
      n += 1                                                                    # => 2, 3, 4, 5, 6, 7, 8
    }                                                                           # => ["t", "e", "s", "t", "i", "n", "g"]
  end                                                                           # => :change_topline_to_braille_piece

  def change_midline_to_braille_piece
    n = 1                                                                             # => 1
    text.each {|l|                                                                    # => ["t", "e", "s", "t", "i", "n", "g"]
      if l ==('b')||l ==('f')||l ==('i')||l ==('l')||l ==('p')||l ==('s')||l ==('v')  # => false, false, true, false, true, false, false
        midline << "0."                                                               # => ["00", ".0", "0."], ["00", ".0", "0.", "00", "0."]
      elsif l ==('g')||l ==('h')||l ==('j')||l ==('q')||l ==('r')||                   # => false, false, false, false, true
        l ==('t')||l ==('w')                                                          # => true, false, true, false, true
        midline << "00"                                                               # => ["00"], ["00", ".0", "0.", "00"], ["00", ".0", "0.", "00", "0.", ".0", "00"]
      elsif l ==('d')||l ==('e')||l ==('n')||l ==('o')||l ==('y')||                   # => true, true
        l ==('z')                                                                     # => true, true
        midline << ".0"                                                               # => ["00", ".0"], ["00", ".0", "0.", "00", "0.", ".0"]
      elsif l ==('a')||l ==('c')||l ==('k')||l ==('m')||l ==('u')||
        l ==('x')
        midline << ".."
      else
        midline << "#{l}#{l}"
      end                                                                             # => ["00"], ["00", ".0"], ["00", ".0", "0."], ["00", ".0", "0.", "00"], ["00", ".0", "0.", "00", "0."], ["00", ".0", "0.", "00", "0.", ".0"], ["00", ".0", "0.", "00", "0.", ".0", "00"]
      n +=1                                                                           # => 2, 3, 4, 5, 6, 7, 8
    }                                                                                 # => ["t", "e", "s", "t", "i", "n", "g"]
  end                                                                                 # => :change_midline_to_braille_piece

  def change_botline_to_braille_piece
    n = 1                                                                     # => 1
    text.each {|l|                                                            # => ["t", "e", "s", "t", "i", "n", "g"]
      if l ==('k')||l ==('l')||l ==('m')||l ==('n')||l ==('o')||l ==('p')||   # => false, false, false, false, false, true, false
      l ==('q')||l ==('r')||l ==('s')||l ==('t')                              # => true, false, true, true, false, true, false
      botline << "0."                                                         # => ["0."], ["0.", "..", "0."], ["0.", "..", "0.", "0."], ["0.", "..", "0.", "0.", "..", "0."]
    elsif l ==('u')||l ==('v')||l ==('x')||l ==('y')||l ==('z')               # => false, false, false
      botline << "00"
    elsif l ==('a')||l ==('b')||l ==('d')||l ==('e')||l ==('f')||l ==('g')||  # => true, false, true
      l ==('h')||l ==('i')||l ==('j')                                         # => true, true, true
      botline << ".."                                                         # => ["0.", ".."], ["0.", "..", "0.", "0.", ".."], ["0.", "..", "0.", "0.", "..", "0.", ".."]
    else
      botline << "#{l}#{l}"
    end                                                                       # => ["0."], ["0.", ".."], ["0.", "..", "0."], ["0.", "..", "0.", "0."], ["0.", "..", "0.", "0.", ".."], ["0.", "..", "0.", "0.", "..", "0."], ["0.", "..", "0.", "0.", "..", "0.", ".."]
    n +=1                                                                     # => 2, 3, 4, 5, 6, 7, 8
  }                                                                           # => ["t", "e", "s", "t", "i", "n", "g"]
  end                                                                         # => :change_botline_to_braille_piece

  def output_braille
    change_topline_to_braille_piece                                  # => ["t", "e", "s", "t", "i", "n", "g"]
    change_midline_to_braille_piece                                  # => ["t", "e", "s", "t", "i", "n", "g"]
    change_botline_to_braille_piece                                  # => ["t", "e", "s", "t", "i", "n", "g"]
    return topline.join + "\n" + midline.join + "\n" + botline.join  # => ".00..0.0.00000\n00.00.000..000\n0...0.0...0..."
  end                                                                # => :output_braille
end                                                                  # => :output_braille


#if $PROGRAM_NAME == __FILE__
 #input_file = ARGV[0]
 #output_file = ARGV[1]

 nw = NightWrite.new("testing")  # => #<NightWrite:0x007f967c141210 @text=["t", "e", "s", "t", "i", "n", "g"], @topline=[], @midline=[], @botline=[]>
 braille = nw.output_braille     # => ".00..0.0.00000\n00.00.000..000\n0...0.0...0..."


#end
