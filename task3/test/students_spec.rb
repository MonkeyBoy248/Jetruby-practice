require 'rspec'

STUDENTS_TEST_PATH = './task3/test/students_test.txt'
RESULT_TEST_PATH = './task3/test/result_test.txt'

def check_age
  file = File.open(STUDENTS_TEST_PATH)
  students = file.readlines.map { |line| line }
  age = ''

  while age != "-1" && !students.empty?
    puts 'Введите искомый возраст'
    age = STDIN.gets.chomp
    target_students = students.select { |student| student.slice(/\d+/) == age}

    target_students.each do |student|
      File.write(RESULT_TEST_PATH, students.delete(student), mode: 'a')
    end
  end

  File.read(RESULT_TEST_PATH)
end

RSpec.describe 'Students' do
  it 'check age' do
    /Искомый возраст - 24/
    expect(check_age).to eq <<~STRING
      Кетр Сергеевич 24
      Геральт Ривийский 24
      Спайк Бибопович 24
    STRING
  end
end