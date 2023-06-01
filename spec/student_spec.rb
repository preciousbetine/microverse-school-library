require_relative '../classes/student'

describe Student do
  let(:classroom1) { double('classroom') }
  let(:classroom2) { double('classroom') }
  subject { Student.new 16, classroom1 }

  context '#initialize' do
    it 'should initialize a student' do
      expect(subject.id).to be_kind_of Numeric
      expect(subject.age).to eq 16
      expect(subject.name).to eq 'Unknown'
      expect(subject.parent_permission).to eq true
      expect(subject.classroom).to eq(classroom1)
    end
  end

  context '#classroom=' do
    it 'should add student to an existing classroom' do
      students = []
      allow(classroom2).to receive(:students).and_return(students)
      allow(classroom2).to receive(:students=)
      subject.classroom = classroom2
      expect(students).to include(subject)
    end
  end

  context '#play_hooky' do
    it 'should allow a student play hooky' do
      expect(subject.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
