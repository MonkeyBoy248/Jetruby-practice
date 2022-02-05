require 'rspec'

BANDS_FILE_PATH = 'bands_test.txt'
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


RSpec.describe 'Work with file' do
  let(:string) do
    <<-STRING
      TOOL
      Disturbed
      Metallica
      Incubus
    STRING
  end

  before { File.write(BANDS_FILE_PATH, string) }

  it 'index' do
    expect{index}.to output(string).to_stdout
  end

  it 'find' do
    expect(find(3)).to eq 'Incubus'
  end

  it 'where' do
    expect(where('TOOL')).to eq 0
  end

  it 'update' do
    expect(update(2, 'Prime Circle')).to eq 1
  end

  it 'delete' do
    expect(delete(1)).to eq 1
  end
end


