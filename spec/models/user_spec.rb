require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures first_name presence' do
      user = User.new(last_name: 'Last', email: 'sample@example.com', password: '123456').save
      expect(user).to eq(false)
    end

    it 'ignores last_name presence' do
      user = User.new(first_name: 'first', email: 'sample@example.com', password: '123456').save
      expect(user).to eq(true)
    end

    it 'ensures email presence' do
      user = User.new(first_name: 'first', last_name: 'Last', password: '123456').save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(first_name: 'first', last_name: 'Last', email: 'sample@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures password length must be at least 6 characters' do
      user = User.new(first_name: 'first', last_name: 'Last', email: 'sample@example.com', password: '12345').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(first_name: 'first', last_name: 'Last', email: 'sample@example.com', password: '123456').save
      expect(user).to eq(true)
    end
  end
  
end
