def greeting (name, surname, age)
  if (age >= 18)
    "Привет, #{name} #{surname}. Самое время заняться делом!"
  else
    "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  end
end

print "Введите имя:"
name = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)

print "Введите фамилию:"
surname = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)

print "Введите возраст:"
age = STDIN.gets.chomp.to_i

message = greeting(name, surname, age)

puts message