require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(create :user).to be_valid
  end

  it 'is invalid with a too short password' do
    expect(build :user,
                 :password => '23333',
                 :password_confirmation => '23333').to have(1).errors_on(:password)
  end

  it 'is invalid to have two users with the same email' do
    create :user, :email => 'foo@bar.biz'
    expect(build :user, :email => 'foo@bar.biz').to have(1).errors_on(:email)
  end

  it 'is invalid with an invalid email' do
    expect(build :user, :email => 'fo@o@bar.com').to have(1).errors_on(:email)
    expect(build :user, :email => 'foo@bar').to have(1).errors_on(:email)
    expect(build :user, :email => 'foo').to have(1).errors_on(:email)
    expect(build :user, :email => 'foobar@foobar..com').to have(1).errors_on(:email)
  end

  it 'is invalid with a too short or too long name' do
    expect(build :user, :name => 'f').to have(1).errors_on(:name)
    expect(build :user, :name => 'foo' * 30).to have(1).errors_on(:name)
  end


end
