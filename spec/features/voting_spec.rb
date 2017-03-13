require 'rails_helper'

feature 'user upvotes' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, item: item) }

  context 'authenticated user' do
    before do
      sign_in(user)
    end

    scenario 'upvotes', js: true do
      visit item_path(item)

      expect(page).to have_selector('.upvote')
      expect(page).to have_selector('.downvote')
      expect(page).to have_selector('.review')

      page.all('.upvote')[0].click

      expect(page).to have_content('1')
    end
  end
end
