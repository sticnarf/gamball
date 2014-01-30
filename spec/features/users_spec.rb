require 'spec_helper'
require 'faker'
require 'securerandom'

feature 'User management' do
  scenario 'Register a new user with js', js: true do
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
      sleep 0.5
    }.to change(User, :count).by 1
    user = User.find_by(email: email)
    expect(current_path).to eq panel_path
    signed_in_check(user)
    find_by_id('menu').click
    click_link 'logout'
    expect(current_path).to eq root_path
    click_link 'reg'
    expect {
      fill_in 'user_email', with: email
      fill_in 'user_name', with: Faker::Internet.user_name
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'submit'
      sleep 0.5
    }.not_to change(User, :count)
    click_link 'login'
    fill_in 'session_email', with: email
    fill_in 'session_password', with: password.upcase
    click_button 'submit'
    fill_in 'session_email', with: email
    fill_in 'session_password', with: password
    click_button 'submit'
    sleep 0.5
    expect(current_path).to eq panel_path
    signed_in_check(user)
  end
end

private

def signed_in_check(user)
  visit root_path
  expect(current_path).to eq panel_path
  visit new_session_path
  expect(current_path).to eq panel_path
  visit new_user_path
  expect(current_path).to eq panel_path
end