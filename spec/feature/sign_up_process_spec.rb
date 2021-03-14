require 'rails_helper'

RSpec.describe 'Sign Up process', type: :feature do
  let!(:user) { attributes_for :user}

it 'should sign up successfully when I input valid user details' do
  visit new_user_registration_path

  within '#new_user' do
      fill_in 'user_first_name', with: user[:first_name]
      fill_in 'user_last_name', with: user[:last_name]
      fill_in 'user_email', with: user[:email]
      fill_in 'user_password', with: user[:password]
      fill_in 'user_password_confirmation', with: user[:password_confirmation]
      click_button 'Sign up'
  end

  expect(page).to have_content 'Welcome! You have signed up successfully.'
  expect(page.current_path).to eq root_path
end

it 'should not sign up when I input mismatch password' do
  visit new_user_registration_path

  within '#new_user' do
      fill_in 'user_first_name', with: user[:first_name]
      fill_in 'user_last_name', with: user[:last_name]
      fill_in 'user_email', with: user[:email]
      fill_in 'user_password', with: "123456"
      fill_in 'user_password_confirmation', with: "123457"
      click_button 'Sign up'
  end

  expect(page).to have_content "Password confirmation doesn't match Password"
  expect(page.current_path).to eq user_registration_path
end

end