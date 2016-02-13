class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end
#Just for lower case letters...
## Changing to Braille:
### open a message file
###change each char into Braille (remember it's 6 cells (2x3))
###writing file...Braille message
###remember lines are 80 chars max
###don't forget to close the file
### screen message about number of chars

##Changing Braille to message:
###open a Braille file
###read lines (will this go backwards?)
###translate to chars
###open message file
###write in message file
###don't forget to close the file
###screen message about converting (will this need to be divided by 6?)

class NightWriter
  attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end

  def encode_file_to_braille
    # I wouldn't worry about testing this method
    # unless you get everything else done
    plain = reader.read
    braille = encode_to_braille(plain)
  end

  def encode_to_braille(input)
    # you've taken in an INPUT string
    # do the magic
    # send out an OUTPUT string
  end
end

puts ARGV.inspect
