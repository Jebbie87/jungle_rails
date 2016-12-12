require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  before(:each) do
    @user_wo_pwd = User.new(
      first_name: Faker::Superhero.name,
      last_name: Faker::Superhero.power,
      email: 'test@test.COM'
    )

    @user = User.new(
      first_name: Faker::Superhero.name,
      last_name: Faker::Superhero.power,
      email: 'TEST@TESTs.com',
      password: 'test',
      password_confirmation: 'test'
    )
  end

  it "should produce an error message if password field is not present" do
    @user.password = nil
    @user.save
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "should produce an error message if password_confirmation field is not present" do
    @user.password_confirmation = nil
    @user.save
    expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
  end

  it "should produce an error message if first_name field is not present" do
    @user.first_name = nil
    @user.save
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end
  it "should produce an error message if last_name field is not present" do
    @user.last_name = nil
    @user.save
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it "should produce an error message if email field is not present" do
    @user.email = nil
    @user.save
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "should not having matching emails (case insensitive) between two different users" do
    @user.email = @user.email.downcase
    @user_wo_pwd.email = @user_wo_pwd.email.downcase
    @user_wo_pwd.save
    @user.save
    expect(@user.email).not_to eq(@user_wo_pwd.email)
  end

  it "should be matching password and password_confirmation field" do
    expect(@user.password).to eq(@user.password_confirmation)
  end

  it "should not have a password longer or equal to 5 characters" do
    expect(@user.password.length).to be > 5
  end
end
