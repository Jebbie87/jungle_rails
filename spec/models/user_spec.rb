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
      email: '      TEST@TESTs.com     ',
      password: 'tests',
      password_confirmation: 'tests'
    )
  end

  describe 'Validations' do

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
      expect(@user.password.length).to be >= 5
    end
  end

  describe '.authenticate_with_credentials' do
    it "should not be an empty email parameter" do
      @user.email = nil
      @user.save
      user = User.authenticate_with_credentials(@user.email, '123456')
      expect(user).to be_falsey
    end

    it "should not be an empty password field" do
      @user.password = nil
      @user.save
      user = User.authenticate_with_credentials('test@test.com', '')
      expect(user).to be_falsey
    end

    it "should allow users to still log in with trailing white spaces of an email" do
      @user.save
      user = User.authenticate_with_credentials(@user.email, 'tests')
      expect(user.email.strip).to eq(@user.email.strip)
    end

    it "should still allow users to login if they type in the wrong case for their email" do
      @user.email = @user.email.downcase.strip
      @user.save
      user = User.authenticate_with_credentials(@user.email, 'tests')
      expect(@user.email).to eq(user.email.downcase.strip)
    end

  end
end
