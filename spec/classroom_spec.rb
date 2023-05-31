require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  let(:classroom) { Classroom.new('Physics') }
  let(:student) { Student.new(16, classroom) }

  describe '#initialize' do
    it 'Sets the label' do
      expect(classroom.label).to eq('Physics')
    end

    it 'Initializes an empty array of students' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'Adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'Sets the classroom for the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
