require 'rails_helper'

feature 'Login' , %Q{
  As an authenticated user
  I want to login to my account
} do

  scenario 'clicking login will login to my account' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    click_link 'Sign Out'
    click_link 'Login'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'


    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("My Profile")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end
end
