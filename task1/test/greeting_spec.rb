require_relative "../greeting"
require "rspec"

RSpec.describe "Greeting" do
  it "return specific message" do
    expect(greeting("John", "Doe", 22)).to eq  "Привет, John Doe. Самое время заняться делом!"
  end

  it "return specific message when user's age less than 18" do
    expect(greeting("Jotaro", "Kujo", 16)).to eq  "Привет, Jotaro Kujo. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  end
end

