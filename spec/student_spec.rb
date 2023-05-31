require_relative '../classes/student'

describe 'Student' do
  context 'student' do
    it 'should initialize a student' do
      classroom1 = double('classroom')
      student = Student.new(16, classroom1)

      expect(student.id).to be_kind_of Numeric
      expect(student.age).to eq(16)
      expect(student.name).to eq 'Unknown'
      expect(student.parent_permission).to eq true
      expect(student.classroom).to eq(classroom1)
    end

    it 'should add student to an existing classroom' do
      classroom1 = double('classroom')
      student = Student.new(16, classroom1)
      classroom2 = double('classroom')
      classroom2_students = []

      allow(classroom2).to receive(:students).and_return(classroom2_students)
      allow(classroom2).to receive(:students=)
      student.classroom = classroom2
      expect(classroom2_students).to include(student)
    end

    it 'should allow a student play hooky' do
      classroom1 = double('classroom')
      student = Student.new(16, classroom1)
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
