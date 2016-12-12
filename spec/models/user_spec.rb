require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  before(:each) do
    @user_wo_pwd = User.new(
      first_name: Faker::Superhero.name,
      last_name: Faker::Superhero.power,
      email: 'super@powers.com'
    )

    @user = User.new(
      first_name: Faker::Superhero.name,
      last_name: Faker::Superhero.power,
      email: 'super@powers.com',
      password: 'test',
      password_confirmation: 'test123'
    )
  end

  it "should have a filled out password field that is not a nil value" do
    expect(@user_wo_pwd.password).to be_nil
    should vali
  end

  it "should have a filled out password_confirmation field that is not a nil value" do
    expect(@user.password_confirmation).to be(true)
    expect(@user_wo_pwd.password_confirmation).to be(false)
  end

  # it "should be matching password and password_confirmation field" do
  #   @user.password_confirmation = 'test123'
  #   expect(@user.password).to eq(@user.password_confirmation)
  # end

end
