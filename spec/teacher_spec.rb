require_relative '../classes/teacher.rb'

describe 'Teacher' do
  context 'teacher' do 
    it 'should intitalize a teacher' do 
        teacher = Teacher.new(30, 'Physics', name='Unknown')
        expect(teacher.name).to eq 'Unknown'
        expect(teacher.age).to eq 30 
        expect(teacher.specialization).to eql 'Physics' 
        expect(teacher.parent_permission).to be true
    end
    it 'should allow a teacher to se services' do 
        teacher = Teacher.new(30, 'Physics', name='Unknown')
        expect(teacher.can_use_services?).to be true
    end
end
end