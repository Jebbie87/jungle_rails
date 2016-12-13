require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    2.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(4),
        description: Faker::Hipster.paragraph(5),
        image: open_asset('apparel2.jpg'),
        quantity: 2,
        price: 64.99
    )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    #user should click on the add button on home page
    # click_link('shopping-cart')
    # page.find('.btn-primary').click
    # puts page
    # puts page.html
    find_link('Add', :href => add_item_cart_path(product_id: 12)).click
    find_link('Add', :href => add_item_cart_path(product_id: 10)).click
    find_link('Add', :href => add_item_cart_path(product_id: 9)).click
    find_link('Add', :href => add_item_cart_path(product_id: 1)).click

    # click_link
    puts page.html
    #the my cart number should go up by one


    # DEBUG
    save_screenshot

    #VERIFY
    # expect(page).to have_css 'article.product', count: 10
  end

end