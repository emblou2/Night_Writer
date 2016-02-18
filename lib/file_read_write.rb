require_relative "../lib/night_write.rb"

class FileRead
  def read
    filename = ARGV[0]
    File.read(filename).chomp
  end
end

class FileWrite

  def write(output)
    filename = ARGV[1]
    File.write(filename, output)
    filename

  end
end
