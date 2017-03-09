require 'rails_helper'

feature 'Create Review' , %Q{
  As an authenticated user
  I want to add a review to an item
  So that others can read it
} do

  scenario 'clicking Submit a review will add a review to list' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    click_link 'Items'
    click_link 'Add New Item'
    fill_in 'Name', with: "things"
    click_button 'Add Item'
    fill_in 'Submit a review', with: "Test review"
    click_button "Submit"

    expect(page).to have_content("Review successfully saved!!")
    expect(page).to have_content("Test review")
  end


  scenario 'Adding a review with a blank body' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    click_link 'Items'
    click_link 'Add New Item'
    fill_in 'Name', with: "things"
    click_button 'Add Item'
    fill_in 'Submit a review', with: ""
    click_button "Submit"

    expect(page).to have_content("Review did not save.")
  end

  scenario 'Unauthenticated user attempts to add review' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    click_link 'Items'
    click_link 'Add New Item'
    fill_in 'Name', with: "things"
    click_button 'Add Item'
    click_link 'Sign Out'
    click_link 'Items'
    click_link 'things'

    expect(page).to_not have_content("Submit a review")
  end
end
