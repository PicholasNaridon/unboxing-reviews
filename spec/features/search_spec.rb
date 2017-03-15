require 'rails_helper'

feature "Search for item using search bar" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item1) { Item.create(name: "Item One", user_id: user.id) }
  let!(:item2) { Item.create(name: "Item Two", user_id: user.id) }

  scenario 'user searches for an item that does exist ' do
    visit root_path
    fill_in 'term', with: item1.name
    click_button 'Search'

    expect(page).to have_content('Item One')
    expect(page).to_not have_content('Item Two')
  end

  scenario 'user searches for nothing in search bar' do
    visit root_path
    fill_in 'term', with: ''
    click_button 'Search'

    expect(page).to have_content('Item One')
    expect(page).to have_content('Item Two')
  end

  scenario 'user searches for an item that does not exist ' do
    visit root_path
    fill_in 'term', with: item2.name
    click_button 'Search'

    expect(page).to_not have_content('Item One')
  end
end
