def pokemons_show
  hash_arr = []
  puts "Сколько покемонов вы хотите добавить?"
  number = STDIN.gets.chomp.to_i

  number.times do |name, color|
    puts "Введите имя покемона"
    name = STDIN.gets.chomp

    puts "Введите цвет покемона"
    color = STDIN.gets.chomp

    pair = { name: name, color: color }
    hash_arr.push(pair)
  end
  hash_arr
end


pokemons = pokemons_show()
print pokemons


