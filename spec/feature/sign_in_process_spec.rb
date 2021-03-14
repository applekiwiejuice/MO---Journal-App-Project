require 'rails_helper'

RSpec.describe 'Sign In process', type: :feature do
  let!(:user) { attributes_for :user}

  before do
    user = FactoryBot.create(:user)
  end

  it 'should log me in when I input valid user details' do
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_email', with: user[:email]
      fill_in 'user_password', with: user[:password]

      click_button 'Log in'
    end

    expect(page).to have_content 'Signed in successfully.'
    expect(page.current_path).to eq root_path
  end

  it 'should not log me in when I input invalid user details' do
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_email', with: 'victor@avionschool.com'
      fill_in 'user_password', with: 'password-ni-victor'

      click_button 'Log in'
    end

    expect(page).to have_content 'Invalid Email or password.'
    expect(page.current_path).to eq new_user_session_path
  end
end