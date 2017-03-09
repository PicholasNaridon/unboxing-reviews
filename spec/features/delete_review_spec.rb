require 'rails_helper'

feature 'Delete Review' , %Q{
  As an authenticated user
  I want to delete a review to an item
  So that it no longer appears
} do

  scenario 'clicking Delete Review will delete the review' do
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
    click_link 'Delete Review'

    expect(page).to have_content("Deleted")
    expect(page).to_not have_content("Test review")
  end


  scenario 'Unauthenticated user attempts to delete review' do
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
    click_link 'Sign Out'
    click_link 'Items'
    click_link 'things'

    expect(page).to_not have_content("Delete Review")
  end
end
