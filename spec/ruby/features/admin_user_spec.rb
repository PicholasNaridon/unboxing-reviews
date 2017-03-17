require 'rails_helper'

feature "admin sees all users" do
  let!(:admin) { User.create(email: 'user@user.com', username: 'admin', password: 'password', password_confirmation: 'password', admin: true) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'admin visits all users link and sees all users' do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link 'Admin'

    expect(page).to have_content "User List"
  end

  scenario 'admin deletes user' do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit admin_users_path
    click_link user.username
    click_link 'Delete User'
    visit admin_users_path

    expect(page).to_not have_content(user.username)
  end

  scenario 'user cannot reach admin path' do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit admin_users_path

    expect(page).to_not have_content("User list")

  end
end
