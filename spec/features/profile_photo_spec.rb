require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    attach_file('file', "#{Rails.root}/spec/support/images/photo.png", visible: false)
    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_css("img[src*='photo.png']")
  end
  scenario "Should not see profile photo" do
    visit root_path
    click_link "Sign Up"

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    attach_file('file', "#{Rails.root}/spec/support/images/photo.png", visible: false)
    click_button "Sign Up"
    click_link "Sign Out"

    expect(page).to_not have_content("Welcome! You have signed up successfully.")
    expect(page).to_not have_css("img[src*='photo.png']")
  end

end
