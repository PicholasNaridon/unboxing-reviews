require 'rails_helper'

feature 'Edit Review' , %Q{
  As an authenticated user
  I want to edit a review to an item
  So that it is correct!
} do

  scenario 'clicking Edit will update the content of the review' do
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
    click_button 'Submit'
    click_link 'Edit Review'
    fill_in 'Submit a review', with: 'Edited review'
    click_button 'Submit'

    expect(page).to have_content("review was updated")
    expect(page).to have_content("Edited review")
  end

  scenario 'Editing a review without filling in body' do
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
    click_button 'Submit'
    click_link 'Edit Review'
    fill_in 'Submit a review', with: ''
    click_button 'Submit'

    expect(page).to_not have_content("review was updated")
    expect(page).to have_content("Body can't be blank")
  end

  scenario 'Unauthenticated user attempts to edit review' do
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

    expect(page).to_not have_content("Edit Review")
  end
end
