require 'rails_helper'

feature 'Delete Account' , %Q{
  As an authenticated user
  I want to delete my accounty
  So that my information is no longer retained by the app
} do

  scenario 'deleting users account' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    click_link 'My Profile'
    click_button 'Cancel my account'

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Login")
    expect(page).to_not have_content("Sign Out")


  end
end
