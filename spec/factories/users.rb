require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    password 'secret'
    password_confirmation 'secret'
    email { Faker::Internet.free_email }
  end
end