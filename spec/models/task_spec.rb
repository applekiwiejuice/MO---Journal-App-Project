require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:user) { create(:user) }
  let!(:category) { create(:category) }

  it { should belong_to(:category) }

  context 'validation tests' do
    it 'ensures task name presence' do
      task = Task.new(task_description: 'This is a task description', category_id: 1).save
      expect(task).to eq(false)
    end

    it 'ensures task description presence' do
      task = Task.new(task_name: 'This is a task name', category_id: 1).save
      expect(task).to eq(false)
    end

    it 'task should save successfully' do
      task = Task.new(task_name: 'This is a task name', task_description: 'This is a task description', category_id: 1).save
      expect(task).to eq(true)
    end
  end
end
