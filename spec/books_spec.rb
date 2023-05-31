require_relative '../classes/book.rb'

describe 'Books' do
  context 'books' do
    it 'should initialize a book' do
      book = Book.new('Title', 'Author')
      expect(book.id).to be_kind_of Numeric
      expect(book.rentals).to eql []
      expect(book.title).to eql 'Title'
      expect(book.author).to eql 'Author'
    end

    it 'should add rentals' do
      book = Book.new('Title', 'Author')

      rental1 = double('rental')
      rental2 = double('rental')
      allow(rental1).to receive(:book=)
      allow(rental2).to receive(:book=)

      book.add_rental(rental1)
      book.add_rental(rental2)

      expect(book.rentals.length).to eql 2
    end
  end
end
