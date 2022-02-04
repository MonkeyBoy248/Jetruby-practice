require_relative "../foobar"
require "rspec"

RSpec.describe "Foobar" do
  it "return value not equal to 20" do
    expect(foobar(21, 20)).to eq  21
  end

  it "return value not equal to 20" do
    expect(foobar(20, 25)).to eq  25
  end

  it "return sum of two numbers if non of them is 20" do
    expect(foobar(54, 33)).to eq 87
  end
end


