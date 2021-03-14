require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:user) { create(:user) }

  it { should have_many(:tasks) }
  it { should belong_to(:user) }

  context 'validation tests' do
    it 'ensures category name presence' do
      category = Category.new(category_description: 'This is a category description', user_id: 1).save
      expect(category).to eq(false)
    end

    it 'ensures category description presence' do
      category = Category.new(category_name: 'This is a category name', user_id: 1).save
      expect(category).to eq(false)
    end

    it 'category should save successfully' do
      # category = Category.new(id: 1, category_name: 'This is a category name', category_description: 'This is a category description', created_at: DateTime.now, updated_at: DateTime.now, user_id: 1).save
      category = Category.new(category_name: 'This is a category name', category_description: 'This is a category description', user_id: 1).save
      expect(category).to eq(true)
    end
  end
end
