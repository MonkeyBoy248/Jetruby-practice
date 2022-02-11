require 'rspec'

def check_str_end(string)
  if string.upcase.end_with?("CS")
    2 ** string.length
  else string.reverse
  end
end

RSpec.describe 'Check string end' do
  it 'return 2 in degree of sting length when string ends with CS' do
    expect(check_str_end('ucs')).to eq 8
  end

  it 'return reversed string' do
    expect(check_str_end('foobar')).to eq 'raboof'
  end
end
