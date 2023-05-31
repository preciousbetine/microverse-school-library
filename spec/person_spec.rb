require_relative '../classes/person.rb'

describe 'Persons' do
  context 'persons' do
    it 'should initialize a person' do
      person = Person.new(20, name='Precious', parent_permission:false)
      expect(person.id).to be_kind_of Numeric
      expect(person.name).to eql 'Precious'
      expect(person.parent_permission).to eql false
      expect(person.age).to eql 20
      expect(person.rentals).to eql []
    end

    it 'should add rentals' do
      person = Person.new(20, name='Precious', parent_permission:false)

      rental1 = double('rental')
      rental2 = double('rental')
      allow(rental1).to receive(:person=)
      allow(rental2).to receive(:person=)

      person.add_rental(rental1)
      person.add_rental(rental2)

      expect(person.rentals.length).to eql 2
    end

    it 'should not allow a person to use services' do
      person = Person.new(17, name='Precious', parent_permission:false)

      expect(person.can_use_services?).to be false
    end

    it 'should allow a person to use services' do
      person = Person.new(18, name='Precious', parent_permission:false)

      expect(person.can_use_services?).to be true
    end

    it 'should correct a person\'s name' do
      person = Person.new(18, name='Precious', parent_permission:false)

      expect(person.name).to eql 'Precious'
    end
  end
end
