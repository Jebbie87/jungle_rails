require 'rails_helper'
require 'faker'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'test')
      @product = @category.products.build(
        name: Faker::Name.name,
        price_cents: Faker::Number.number(4),
        quantity: Faker::Number.number(2)
      )
    end

    it 'should be valid with all 4 fields filled' do
      @product.save
      expect(@product).to be_valid
    end

    it "should be an error message with 'Name can't be blank'" do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should make sure there is a price' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end

    it 'should make sure there is quantity included' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should make sure there is a category' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
