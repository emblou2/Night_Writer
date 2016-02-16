require_relative 'file_reader'
require_relative 'file_writer'

class NightWriter
  attr_reader :file_reader
  attr_writer :file_writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def encode_file_to_braille
    # I wouldn't worry about testing this method
    # unless you get everything else done
    plain = @reader.read
    braille = encode_to_braille(plain)
    @writer.write(braille)
  end



  def encode_to_braille(input)
    input * 3
    # you've taken in an INPUT string
    # do the magic
    # send out an OUTPUT string
  end
end

puts ARGV.inspect
