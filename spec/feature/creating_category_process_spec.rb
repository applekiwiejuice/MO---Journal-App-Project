require 'rails_helper'

RSpec.describe 'Creating category process', type: :feature do
  let!(:user) { attributes_for :user}
  let!(:category) { attributes_for :category }
  
  before do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    sign_in(user)
  end

  it 'creates a category' do
    visit root_path
    click_link "MO Categories"
    click_link "New Category"

    within "form" do
      # fill_in "category_category_name", with: category[:category_title]
      # fill_in "category_category_description", with: category[:category_description]
      fill_in "category_category_name", with: "category name"
      fill_in "category_category_description", with: "category description"

      click_button 'Create Category'
    end

    expect(page).to have_content 'Category was successfully created.'
    expect(page).to have_current_path(category_path(user[:id]))
    # expect(page).to have_content category[:category_title]
    # expect(page).to have_content category[:category_description][0..40]
    expect(page).to have_content "category name"
    expect(page).to have_content "category description"
  end

  it 'doesn\'t create a category' do
    visit root_path
    click_link "MO Categories"
    click_link "New Category"

    within "form" do
      click_button 'Create Category'
    end

    expect(page.current_path).to eq categories_path

    within "form" do
      expect(page).to have_content "can't be blank"
    end
  end
end