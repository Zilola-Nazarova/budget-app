require 'rails_helper'

RSpec.describe User, type: :model do
  # before :all do
  #   User.delete_all
  # end

  context 'attribute name' do
    it 'is valid with existing name' do
      expect(User.new(name: 'Tom', email: 'tom@example.com', password: 'topsecret')).to be_valid
    end

    it 'is not valid with blank name' do
      expect(User.new(name: nil, email: 'tom@example.com', password: 'topsecret')).to_not be_valid
    end

    it 'is not valid with name of more than 36 chars' do
      expect(User.new(name: 'A' * 37, email: 'tom@example.com', password: 'topsecret')).to_not be_valid
    end
  end

  context 'attribute email' do
    it 'is valid with existing email' do
      expect(User.new(name: 'Tom', email: 'tom@example.com', password: 'topsecret')).to be_valid
    end

    it 'is not valid with blank email' do
      expect(User.new(name: 'Tom', password: 'topsecret')).to_not be_valid
    end

    it 'is not valid with email of wrong format' do
      expect(User.new(name: 'A' * 37, email: 'tomexample.com', password: 'topsecret')).to_not be_valid
    end
  end

  context 'attribute password' do
    it 'is valid with existing password' do
      expect(User.new(name: 'Tom', email: 'tom@example.com', password: 'topsecret')).to be_valid
    end

    it 'is not valid with blank password' do
      expect(User.new(name: 'Tom', email: 'tom@example.com')).to_not be_valid
    end

    it 'is not valid with password less than 6 characters' do
      expect(User.new(name: 'A' * 37, email: 'tomexample.com', password: 'topt')).to_not be_valid
    end
  end
end
