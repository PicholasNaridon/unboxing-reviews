require 'rails_helper'

feature 'Delete Item' , %Q{
  As an authenticated user
  I want to delete items
} do

  scenario 'clicking login will login to my account' do
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
    click_link 'Delete Item'

    expect(page).to have_content("Item has been deleted!")
    expect(page).to_not have_content("things")
  end
end
