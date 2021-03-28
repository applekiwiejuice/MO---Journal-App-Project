require 'rails_helper'

RSpec.describe 'Creating task process', type: :feature do
  let!(:user) { attributes_for :user}
  let!(:category) { attributes_for :category }

  before do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    sign_in(user)

    visit root_path
    click_link "startOrganizing"
    click_link "addCategory"

    within "form" do
      fill_in "category_category_name", with: "category name"
      fill_in "category_category_description", with: "category description"
      click_button 'Create/Update Category'
    end

    visit root_path
    click_link "startOrganizing"
    click_link "View Tasks"
    click_link "addTask"
  end

  it 'creates a task with valid attributes' do
    within "form" do
      fill_in "task_task_name", with: "task name"
      fill_in "task_task_description", with: "task description"

      click_button 'Create/Update Task'
    end

    expect(page).to have_content 'Task was successfully created.'
    expect(page).to have_current_path(category_tasks_path(user[:id]))
    expect(page).to have_content "task name"
    expect(page).to have_content "task description"
  end

  it 'doesn\'t create a task with empty attributes' do
    within "form" do
      click_button 'Create/Update Task'
    end

    expect(page.current_path).to eq category_tasks_path(2)

    within "form" do
      expect(page).to have_content "can't be blank"
    end
  end
end