require_relative '../classes/student.rb'

describe 'Student' do 
    context 'student' do 
        it 'Should initialize a student' do 
            classroom1 = double('classroom')
            student = Student.new(16, classroom1)
            expect(student.id).to be_kind_of Numeric
            expect(student.age).to eq(16)
            expect(student.name).to eq 'Unknown'
            expect(student.parent_permission).to eq true
            expect(student.classroom).to eq (classroom1)
        end
        it 'Should add student to a new classroom' do
            classroom1 = double('classroom')
            student = Student.new(16, classroom1)
            classroom2 = double('classroom')
            students = []
            allow(classroom2).to receive(:students).and_return(students)
            allow(classroom2).to receive(:students=)
            student.classroom = classroom2
            expect(students).to include(student)
        end
    end
end