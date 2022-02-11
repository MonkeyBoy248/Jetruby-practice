require 'rspec'

BALANCE_TEST_FILE_PATH = 'balance_test.txt'

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
  File.write(BALANCE_TEST_FILE_PATH, balance)
end

RSpec.describe 'ATM' do
  it 'shows balance' do
    expect(show_balance(100.0)).to eq 100.0
  end

  it 'deposit' do
    /Депозит - 50/
    expect(deposit(100.0)).to eq 150.0
  end

  it 'withdraw' do
    /Размер снимаемой суммы - 50/
    expect(withdraw(100.0)).to eq 50.0
  end

  it 'save' do
    expect(save_balance(100)).to eq 3
  end
end
