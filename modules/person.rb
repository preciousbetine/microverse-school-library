require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/classroom'

module PERSON
  def list_all_people
    puts 'No persons available!' unless @students.length.positive? || @teachers.length.positive?
    list_students
    list_teachers
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'

    loop do
      print 'Your input: '
      input = gets.strip.to_i
      case input
      when 1
        create_student
        break
      when 2
        create_teacher
        break
      when 3
        puts 'Create person cancelled!'
        break
      else
        puts 'Enter 1 for student, or 2 for teacher, 3 to cancel'
      end
    end
    puts
  end

  def list_students
    return if @students.empty?

    puts 'All students: '
    @students.each_with_index do |student, index|
      puts "#{index + 1}. Name: #{student.name}, Age: #{student.age}, Classroom: #{student.classroom.label}"
    end
  end

  def list_teachers
    return if @teachers.empty?

    puts 'All teachers: '
    @teachers.each_with_index do |teacher, index|
      puts "#{index + 1}. Name: #{teacher.name}, Age: #{teacher.age}, Specialization: #{teacher.specialization}"
    end
  end

  def student_details
    student = { name: '', age: 0, classroom: nil }
    loop do
      print 'Enter student name: '
      student[:name] = gets.strip
      break unless student[:name].empty?
    end
    loop do
      print 'Enter student age: '
      student[:age] = gets.strip.to_i
      break unless student[:age].zero?
    end
    loop do
      print 'Enter classroom label: '
      classroom_label = gets.strip
      student[:classroom] = Classroom.new(classroom_label) if classroom_label.length
      break if classroom_label.length

      puts 'Enter a valid classroom label!'
    end
    student
  end

  def create_student
    puts 'Creating student...'
    details = student_details
    student = Student.new(details[:age], details[:classroom], details[:name])
    @students << student
    puts 'Student created successfully!'
  end

  def teacher_details
    teacher = { name: '', age: 0, specialization: nil }
    loop do
      print 'Enter teacher\'s name: '
      teacher[:name] = gets.strip
      break unless teacher[:name].empty?
    end
    loop do
      print 'Enter teacher\'s age: '
      teacher[:age] = gets.strip.to_i
      break unless teacher[:age].zero?
    end
    loop do
      print 'Enter teacher\'s specialization: '
      teacher[:specialization] = gets.strip
      break unless teacher[:specialization].empty?
    end
    teacher
  end

  def create_teacher
    puts 'Creating teacher...'
    details = teacher_details
    teacher = Teacher.new(details[:age], details[:specialization], details[:name])
    @teachers << teacher
    puts 'Teacher created successfully!'
  end
end
