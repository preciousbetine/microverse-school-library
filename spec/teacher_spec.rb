require_relative '../classes/teacher.rb'

describe 'Teacher' do
  context 'teacher' do 
    it 'should intitalize a teacher' do 
        teacher = Teacher.new(30, name='Unknown', specialization:'Physics')
        expect(teacher.name).to eq 'Unknown'
        expect(teacher.age).to eq 30 
        expect(teacher.specialization).to eq ' Physics' 
    end
end
end