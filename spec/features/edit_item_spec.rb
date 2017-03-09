require 'rails_helper'

feature "Add Review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }

  scenario 'clicking edit should update the item when signed in ' do
    sign_in(user)
    visit item_path(item)
    click_link 'Edit'
    fill_in 'Name', with: "somethingelse"
    click_button 'Add Item'

    expect(page).to have_content("Your item has been updated")
    expect(page).to have_content("somethingelse")
    expect(page).to_not have_content("things")
  end

  scenario 'editing item with blank name' do
    sign_in(user)
    visit item_path(item)
    click_link 'Edit'
    fill_in 'Name', with: ""
    click_button 'Add Item'

    expect(page).to_not have_content("Your item has been updated")
    expect(page).to have_content("Name can't be blank")
  end
end
