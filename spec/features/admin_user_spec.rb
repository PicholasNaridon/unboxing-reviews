require 'rails_helper'

feature "admin sees all users" do
  let!(:user)  { User.create(
    email: 'user@user.com'
    username: 'username'
    password: 'password'
    password_confirmation: 'password'
    )}
  let!(:admin)  { User.create(
    email: 'user@user.com'
    username: 'username'
    password: 'password'
    password_confirmation: 'password'
    admin: true
    )}

  scenario 'admin visits all users link and sees all users' do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    expect(page).to have_link("Admin")

    click_link "admin"

    expect(page).to have_content user.username

  end
end
