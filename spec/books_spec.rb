require_relative '../classes/book'

describe Book do
  subject { Book.new('Title', 'Author') }

  context '#initialize' do
    it 'should initialize a book' do
      expect(subject.id).to be_kind_of Numeric
      expect(subject.rentals).to be_empty
      expect(subject.title).to eql 'Title'
      expect(subject.author).to eql 'Author'
    end
  end

  context '#add_rental' do
    it 'should add a rental' do
      rental1 = double('rental')
      rental2 = double('rental')
      allow(rental1).to receive(:book=)
      allow(rental2).to receive(:book=)

      subject.add_rental(rental1)
      subject.add_rental(rental2)

      expect(subject.rentals.length).to eql 2
    end
  end
end
