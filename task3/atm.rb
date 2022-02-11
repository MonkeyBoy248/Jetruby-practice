BALANCE_PATH = './task3/balance.txt'
BALANCE_START = 100.0

def deposit(balance)
  puts 'Введите сумму, которую хотите внести на свой счет'
  sum = STDIN.gets.chomp.to_f

  if (sum > 0)
    balance + sum
  else
    puts 'Сумма депозита не может быть отрицательной или равной нулю. Пожалуйста, ведите корректное число'
  end
end

def show_balance(balance)
  balance
end

def withdraw(balance)
  puts 'Введите сумму, которую хотите снять со счета'
  sum = STDIN.gets.chomp.to_f

  if (sum > 0 && sum <= balance)
    balance - sum
  else
    puts 'Снимаемая сумма не может быть отрицательной или больше текущего баланса. Пожалуйста, введите корректное число'
  end
end

def save_balance(balance)
  File.write(BALANCE_PATH, balance)
end

balance = File.exists?(BALANCE_PATH) ? File.read(BALANCE_PATH).to_f : BALANCE_START

def atm(balance)
  puts <<~STRING
    Введите код операции:
    B - посмотреть баланс.
    D - положить сумму на счет.
    W - снять сумму со счета.
    Q - сохранить текущий баланс и выйти из программы.
  STRING

  operation = STDIN.gets.chomp.upcase

  case operation
  when 'B'
    puts "Текущий баланс: #{show_balance(balance)}"
  when 'D'
    balance = deposit(balance)
    puts "Текущий баланс: #{balance}"
  when 'W'
    balance = withdraw(balance)
    puts "Текущий баланс: #{balance}"
  when 'Q'
    save_balance(balance)
    exit
  end
  atm balance
end

atm balance
