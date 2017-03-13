require 'rails_helper'

feature "Add upvote" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, item: item)}

  scenario 'if user clicks upvote an upvote appears on page' do
    sign_in(user)
    visit item_path(item)
    click_button "upvote"
  end
end
