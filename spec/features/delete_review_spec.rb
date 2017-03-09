require 'rails_helper'

feature "Add Review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }

  scenario 'clicking delete review should delete the review when signed in ' do
    sign_in(user)
    visit item_path(item)
    fill_in 'Submit a review', with: "Test review"
    choose("review_rating_1")
    click_button "Submit"
    click_link 'Delete Review'

    expect(page).to have_content("Deleted")
    expect(page).to_not have_content("Test review")
  end

  scenario 'Unauthenticated user attempts to delete review' do
    visit item_path(item)

    expect(page).to_not have_content("Delete Review")
  end
end
