require 'rails_helper'

feature 'user upvotes' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, item: item) }

  context 'authenticated user' do
    before(:each) do
      sleep(5)
      sign_in(user)
    end

    scenario 'upvote', js: true do
      visit item_path(item)

      expect(page).to have_selector('.upvote')
      expect(page).to have_selector('.downvote')

      page.all('.upvote')[0].click

      expect(page).to have_content('1')
    end

    scenario 'downvote', js: true do
      visit item_path(item)

      expect(page).to have_selector('.upvote')
      expect(page).to have_selector('.downvote')

      page.all('.downvote')[0].click

      expect(page).to have_content('-1')
    end

    scenario 'click downvote twice', js: true do
      visit item_path(item)

      expect(page).to have_selector('.upvote')
      expect(page).to have_selector('.downvote')

      page.all('.downvote')[0].click
      page.all('.downvote')[0].click
      expect(page).to have_content('0')
    end

    scenario 'click upvote twice', js: true do
      visit item_path(item)

      expect(page).to have_selector('.upvote')
      expect(page).to have_selector('.downvote')

      page.all('.upvote')[0].click
      page.all('.upvote')[0].click

      expect(page).to have_content('0')
    end

    scenario 'change downvote to upvote', js: true do
      visit item_path(item)

      expect(page).to have_selector('.upvote')
      expect(page).to have_selector('.downvote')

      page.all('.downvote')[0].click
      page.all('.upvote')[0].click

      expect(page).to have_content('1')
    end

    scenario 'change upvote to downvote', js: true do
      visit item_path(item)

      expect(page).to have_selector('.upvote')
      expect(page).to have_selector('.downvote')

      page.all('.upvote')[0].click
      page.all('.downvote')[0].click

      expect(page).to have_content('-1')
    end
  end

  context 'inauthenticated user' do
    scenario 'cannot vote', js: true do
      visit item_path(item)

      page.all('.downvote')[0].click

      expect(page).to have_content('0')
    end
  end
end
