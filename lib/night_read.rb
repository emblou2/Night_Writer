require "pry"
require_relative "./dictionary.rb"
require_relative './file_read_write.rb'

class NightRead
  attr_reader :braille

  def initialize(braille)
    @braille = braille
  end

  def split_to_6_char_array
    braille.chars.each_slice(6).map { |array| array.join}
  end

  def translate_to_english
    split = split_to_6_char_array
    split.map do |symbol|
      BRAILLE_TO_ALPHA[symbol]
    end.join
  end

end







frw = FileReadWrite.new
input = frw.read
#frw.write(input)
nw = NightRead.new(input)
output = nw.translate_to_english
frw.write(output)
