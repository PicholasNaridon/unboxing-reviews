# feature "Send email" do
#   let!(:user) { FactoryGirl.create(:user) }
#   let!(:item) { FactoryGirl.create(:item, user: user) }
#
#   scenario 'Submitting a review should send an email to that user.' do
#     sign_in(user)
#     visit item_path(item)
#     fill_in 'Submit a review', with: "Test review"
#     choose("review_rating_1")
#     click_button "Submit"
#     binding.pry
#
#     expect(page).to have_content("Review successfully saved!!")
#     expect(page).to have_content("RATING : 1.0 out of 5 stars!")
#     expect(page).to have_content("Test review")
#     expect(ActionMailer::Base.deliveries.count).to eq(1)
#   end
# end
require 'rails_helper'

feature 'Sign up' , %Q{
  As an authenticated user
  I want to sign up
  So that I can add items and reviews
} do

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    click_link 'Items'
    click_link 'Add New Item'
    fill_in 'Name', with: "things"
    click_button 'Add Item'
    fill_in 'Submit a review', with: "Test review"
    choose("review_rating_1")
    click_button "Submit"
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
