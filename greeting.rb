require 'rspec'

def greeting(name, surname, age)
  if age <= 18
    "Привет, #{name} #{surname}. Тебе меньше 18 лет, но учиться программировать никогда не рано"
  else
    "Привет, #{name} #{surname}. Время заняться делом!"
  end
end

print "Введите ваше имя:"
name = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
print "Введите вашу фамилию:"
surname = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
print "Введите ваш возраст:"
age = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil).to_i

puts greeting(name, surname, age)

RSpec.describe "Greeting" do
  it "returns specific greeting message" do
    expect(greeting("Кирилл", "Темный", 21)).to eq "Привет, Кирилл Темный. Время заняться делом!"
  end

  it "returns specific greeting message when user's age less than 18" do
    expect(greeting("Джон", "Доу", 17)).to eq "Привет, Джон Доу. Тебе меньше 18 лет, но учиться программировать никогда не рано"
  end
end




