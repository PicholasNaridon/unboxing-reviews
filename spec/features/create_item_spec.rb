require 'rails_helper'


feature "User creates new item" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "clicking add item will add item to list" do
    sign_in(user)
    click_link 'Items'
    click_link 'Add New Item'
    fill_in 'Name', with: "things"
    click_button 'Add Item'

    expect(page).to have_content("Item added successfully")
    expect(page).to have_content("things")
  end

  scenario "clicking add item will add item to list" do
    sign_in(user)
    click_link 'Items'
    click_link 'Add New Item'
    fill_in 'Name', with: nil
    click_button 'Add Item'

    expect(page).to_not have_content("Item added successfully")
    expect(page).to have_content("Name can't be blank")
  end
end

feature "Non-user tries to create new item" do

  scenario 'Unregistered user cannot add item' do
    visit root_path
    click_link 'Items'
    click_link 'Add New Item'

    expect(page).to have_content("Please log in to use this feature")
  end
end
