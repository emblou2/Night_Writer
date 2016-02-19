

class FileReadWrite
  def read
    filename = ARGV[0]
    File.read(filename).chomp #needs to be -1
  end

  def write(output)
    filename = ARGV[1]
    File.write(filename, output)
    filename
    puts "Created #{filename} containing #{output.size} characters."

  end
end
