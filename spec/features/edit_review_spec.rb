require 'rails_helper'


feature "Edit Review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:item) { FactoryGirl.create(:item, user: user) }


  scenario 'clicking Edit will update the content of the review' do
    sign_in(user)
    visit item_path(item)
    fill_in 'Submit a review', with: "Test review"
    click_button "Submit"
    click_link 'Edit Review'
    fill_in 'Submit a review', with: 'Edited review'
    click_button 'Submit'

    expect(page).to have_content("review was updated")
    expect(page).to have_content("Edited review")
  end

  scenario 'Editing a review without filling in body' do
    sign_in(user)
    visit item_path(item)
    fill_in 'Submit a review', with: "Test review"
    click_button "Submit"
    click_link 'Edit Review'
    fill_in 'Submit a review', with: ''
    click_button 'Submit'

    expect(page).to_not have_content("review was updated")
    expect(page).to have_content("Body can't be blank")
  end

  scenario 'Unauthenticated user attempts to edit review' do
    visit item_path(item)


    expect(page).to_not have_content("Edit Review")
  end
end
