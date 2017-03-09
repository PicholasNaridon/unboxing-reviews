require 'rails_helper'


feature "Add Review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }


  scenario 'clicking submit a review should submit a review when signed in ' do
    sign_in(user)
    visit item_path(item)
    fill_in 'Submit a review', with: "Test review"
    click_button "Submit"

    expect(page).to have_content("Review successfully saved!!")
    expect(page).to have_content("Test review")
  end


  scenario 'Adding a review with a blank body' do
    sign_in(user)
    visit item_path(item)
    fill_in 'Submit a review', with: ""
    click_button "Submit"

    expect(page).to have_content("Review did not save.")
  end

  scenario 'Unauthenticated user attempts to add review' do
    visit item_path(item)


    expect(page).to_not have_content("Submit a review")
  end
end
