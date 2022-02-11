STUDENTS_PATH = './task3/students.txt'
RESULT_PATH = './task3/result.txt'

def check_age
  file = File.open(STUDENTS_PATH)
  students = file.readlines.map { |line| line }
  checked_students = []
  file.close
  age = ''

  while age != "-1" && checked_students.length != students.length
    puts 'Введите искомый возраст'
    age = STDIN.gets.chomp
    target_students = students.select { |student| student.slice(/\d+/) == age}

    target_students.each do |student|
      if(!checked_students.include?(student))
        File.write(RESULT_PATH, student, mode: 'a')
        checked_students.push(student)
      end
    end
  end
  File.read(RESULT_PATH)
end

puts check_age