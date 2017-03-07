require 'rails_helper'

feature 'Sign Out' , %Q{
  As an authenticated user
  I want to sign out
} do

  scenario 'clicking sign out button and successfully signing out' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    click_link 'Sign Out'

    expect(page).to have_content("Signed out successfully.")
    expect(page).to have_content("Login")
    expect(page).to have_content("Sign Up")
    expect(page).to_not have_content("Sign Out")
  end
end
