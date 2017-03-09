require 'rails_helper'

feature "Delete Item" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }

  scenario 'clicking delete should delete item when signed in ' do
    sign_in(user)
    visit item_path(item)
    click_link 'Delete Item'

    expect(page).to have_content("Item has been deleted!")
    expect(page).to_not have_content("things")
  end

  scenario 'clicking on item should not show "delete item" when signed out' do
    sign_in(user)
    visit item_path(item)
    click_link 'Sign Out'
    visit item_path(item)

    expect(page).to_not have_content("Delete Item")
  end
end
