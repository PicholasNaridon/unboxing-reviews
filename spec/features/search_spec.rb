require 'rails_helper'

feature "Search for item using search bar" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item_1) { FactoryGirl.create(:item, user: user) }
  let!(:item_2) { FactoryGirl.create(:item, user: user) }

  scenario 'user searches for an item that does exist ' do
    visit root_path
    click_link 'Items'
    fill_in 'term', with: item_1.name
    click_button 'Search'

    expect(page).to have_content(item_1.name)
    expect(page).to_not have_content(item_2.name)
  end

  scenario 'user searches for nothing in search bar' do
    visit root_path
    click_link 'Items'
    fill_in 'term', with: ''
    click_button 'Search'

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
  end

  scenario 'user searches for an item that does not exist ' do
    visit root_path
    click_link 'Items'
    fill_in 'term', with: item_1.name
    click_button 'Search'

    expect(page).to_not have_content(item_1.name)
  end
end
