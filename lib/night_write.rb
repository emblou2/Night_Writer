require "pry"
require_relative './file_read_write.rb'
require_relative './dictionary.rb'

class NightWrite
  attr_reader :text

  def initialize(text)
    @text = text.chars
  end

  def translate_to_braille
    b = text.map do |char|
      ALPHA_TO_BRAILLE[char]
    end
    output_three_lines(b)
  end

  def output_three_lines(braille_array)
    output = ""
    braille_array.each do | array |
      output << array[0]
    end
    output << "\n"
    braille_array.each do | array |
      output << array[1]
    end
    output << "\n"
    braille_array.each do | array |
      output << array[2]
    end
    output
  end


end

#frw = FileReadWrite.new
#input = frw.read
#frw.write(input)
#nw = NightWrite.new(input)
#output = nw.translate_to_braille
#frw.write(output)
