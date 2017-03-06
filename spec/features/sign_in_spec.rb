require 'spec_helper'

feature 'sign up' , %Q{
  As an unauthenticated user
  I want to be able to sign up
  so that I can create a review and a new item posting
} do

# Acceptance Criteria
# * I must specify a valid email address
# * I must specify a password, and confirm that passowrd
# * If i do not perform the above, I get an error message
# * If I specify valid information, I register my account and am authenticated

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password' , with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("You're now a user!")
    expect(page).to have_content("Sign Out")
  end

end
