STUDENTS_PATH = './task3/students.txt'
RESULT_PATH = './task3/result.txt'

def check_age
  file = File.open(STUDENTS_PATH)
  students = file.readlines.map { |line| line }
  file.close
  age = ''

  while age != "-1" && !students.empty?
    puts 'Введите искомый возраст'
    age = STDIN.gets.chomp
    target_students = students.select { |student| student.slice(/\d+/) == age}

    target_students.each do |student|
      File.write(RESULT_PATH, students.delete(student), mode: 'a')
    end
  end
  File.read(RESULT_PATH)
end

puts check_age