require 'rails_helper'

RSpec.feature "Visitor logs into their account", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Jeffrey',
      last_name: 'Chang',
      email: 'test@test.com',
      password: 'tests',
      password_confirmation: 'tests'
    )
  end

  scenario "They click login button and they enter in their email and password and logs into the correct user" do
    # ACT
    visit root_path

    click_link 'Login'

    page.find_by_id('login-username').click
    fill_in 'login-username', with: 'test@test.com'

    page.find_by_id('login-password').click
    fill_in 'login-password', with: 'tests'

    click_button('Enter the Jungle')
    # DEBUG
    sleep(5)
    save_screenshot

    #VERIFY
    expect(page).to have_css '.signed-in'
  end

  scenario "They click login button and they enter in the right email but with trailing white spaces and still logs in user" do
    # ACT
    visit root_path

    click_link 'Login'

    page.find_by_id('login-username').click
    fill_in 'login-username', with: '    test@test.com    '

    page.find_by_id('login-password').click
    fill_in 'login-password', with: 'tests'

    click_button('Enter the Jungle')
    # DEBUG
    sleep(5)
    save_screenshot

    #VERIFY
    expect(page).to have_css '.signed-in'
  end

  scenario "They click login button and they enter in the right email but with mixed uppercase and lowercase characters and still logs in user" do
    # ACT
    visit root_path

    click_link 'Login'

    page.find_by_id('login-username').click
    fill_in 'login-username', with: '    TeSt@tEst.cOm    '

    page.find_by_id('login-password').click
    fill_in 'login-password', with: 'tests'

    click_button('Enter the Jungle')
    # DEBUG
    sleep(5)
    save_screenshot

    #VERIFY
    expect(page).to have_css '.signed-in'
  end

  scenario "They click login button and they enter in the wrong password" do
    # ACT
    visit root_path

    click_link 'Login'

    page.find_by_id('login-username').click
    fill_in 'login-username', with: '    test@test.com    '

    page.find_by_id('login-password').click
    fill_in 'login-password', with: 'testss'

    click_button('Enter the Jungle')
    # DEBUG
    sleep(5)
    save_screenshot

    #VERIFY
    expect(page.html).to have_css '#loginform'
  end

end