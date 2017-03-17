require 'rails_helper'

feature "Send email" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }

  scenario 'Submitting a review should send an email to that user.' do
    sign_in(user)
    visit item_path(item)
    fill_in 'Submit a review', with: "Test review"
    choose("review_rating_1")
    click_button "Submit"

    expect(page).to have_content("Review successfully saved!!")
    expect(page).to have_content("RATING : 1.0 out of 5 stars!")
    expect(page).to have_content("Test review")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
  feature "Email send failed" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:item) { FactoryGirl.create(:item, user: user) }

    scenario 'Submitting a review does not send an email to that user.' do
      sign_in(user)
      visit item_path(item)
      fill_in 'Submit a review', with: nil
      choose("review_rating_1")
      click_button "Submit"

      expect(page).to_not have_content("Review successfully saved!!")
      expect(page).to_not have_content("RATING : 1.0 out of 5 stars!")
      expect(page).to_not have_content("Test review")
      expect(ActionMailer::Base.deliveries.count).to eq(0)
    end
  end

end
