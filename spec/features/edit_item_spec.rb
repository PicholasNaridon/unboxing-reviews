require 'rails_helper'

feature 'Edit Item' , %Q{
  As an authenticated user
  I want to edit my item
  In case I make a mistake
} do

  scenario 'clicking add item will add item to list' do
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
    click_link 'Edit'
    fill_in 'Name', with: "somethingelse"
    click_button 'Add Item'

    expect(page).to have_content("Your item has been updated")
    expect(page).to have_content("somethingelse")
    expect(page).to_not have_content("things")
  end

  scenario 'clicking add item will add item to list' do
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
    click_link 'Edit'
    fill_in 'Name', with: ""
    click_button 'Add Item'

    expect(page).to_not have_content("Your item has been updated")
    expect(page).to have_content("Name can't be blank")
  end

end
