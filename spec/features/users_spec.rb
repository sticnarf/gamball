require 'spec_helper'
require 'faker'
require 'securerandom'

feature 'User management' do
  scenario 'Register a new user' do
    visit root_path
    expect(current_path).to eq root_path
    click_link 'reg'
    email = Faker::Internet.email
    password = SecureRandom.hex(8).to_i(16).to_s(36) + 'a'
    expect {
      fill_in 'user_email', with: email
      fill_in 'user_name', with: Faker::Internet.user_name
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'submit'
    }.to change(User, :count).by 1
    user = User.find_by(email: email)
    expect(current_path).to eq user_path(user)
    signed_in_check(user)
    click_link 'logout'
    expect(current_path).to eq root_path
    click_link 'login'
    fill_in 'session_email', with: email
    fill_in 'session_password', with: password.upcase
    click_button 'submit'
    expect(current_path).to eq sessions_path
    fill_in 'session_email', with: email
    fill_in 'session_password', with: password
    click_button 'submit'
    expect(current_path).to eq user_path(user)
    signed_in_check(user)
  end
end

private

def signed_in_check(user)
  visit root_path
  expect(current_path).to eq user_path(user)
  visit new_session_path
  expect(current_path).to eq user_path(user)
  visit new_user_path
  expect(current_path).to eq user_path(user)
end