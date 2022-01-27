require 'rspec'

def foobar(operand1, operand2)

  if (operand1 == 20)
    operand2
  elsif (operand2 == 20)
    operand1
  else operand1 + operand2
  end
end

puts foobar(21, 22)

RSpec.describe "Foobar" do
  it "returns second argument if first one is equal to 20" do
    expect(foobar(20, 21)).to eq 21
  end

  it "returns first argument if second one is equal to 20" do
    expect(foobar(55, 20)).to eq 55
  end

  it "returns sum of both if none of them is 20" do
    expect(foobar(25, 25)).to eq 50
  end
end
