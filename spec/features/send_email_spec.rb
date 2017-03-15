require 'rails_helper'

feature "Add Review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }

  scenario 'clicking submit a review should submit a review when signed in ' do
    sign_in(user)
    visit item_path(item)
    fill_in 'Submit a review', with: "Test review"
    choose("review_rating_1")
    click_button "Submit"

    expect(page).to have_content("Test review")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
