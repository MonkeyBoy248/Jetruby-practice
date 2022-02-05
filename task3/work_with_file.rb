BANDS_FILE_PATH = './task3/bands.txt'
BUFFER_PATH = './task3/buffer.txt'

def index
  File.foreach(BANDS_FILE_PATH) { |band| puts band }
end

def where(band_name)
  File.foreach(BANDS_FILE_PATH).with_index do |band, index|
    if band.upcase.include?(band_name.upcase)
      @band_id = index
      break
    end
  end

  @band_id
end

def find(id)
  File.foreach(BANDS_FILE_PATH).with_index do |band, index|
    if index == id
      @band_name = band.chomp.strip
      break
    end
  end

  @band_name
end

def update(id, value)
  buffer = File.open(BUFFER_PATH, 'w')

  File.foreach(BANDS_FILE_PATH).with_index do |band, index|
    buffer.puts(id == index ? value : band)
  end

  buffer.close

  File.write(BANDS_FILE_PATH, File.read(BUFFER_PATH))

  File.delete(BUFFER_PATH) if File.exist?(BUFFER_PATH)
end

def delete(id)
  buffer = File.open(BUFFER_PATH, 'w')

  File.foreach(BANDS_FILE_PATH).with_index do |band, index|
    buffer.puts(band) if index != id
  end

  buffer.close

  File.write(BANDS_FILE_PATH, File.read(BUFFER_PATH))

  File.delete(BUFFER_PATH) if File.exist?(BUFFER_PATH)
end


index
puts find(2)

