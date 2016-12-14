require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @catgory1 = Category.create!(
        name: 'category1'
      )

      @category2 = Category.create!(
        name: 'category2'
      )
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(
        name: 'product1',
        description: 'description1',
        price_cents: 100,
        quantity: 10,
        category_id: 1
      )
      @product2 = Product.create!(
        name: 'product2',
        description: 'description2',
        price_cents: 200,
        quantity: 20,
        category_id: 2
      )
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        total_cents: 600,
        stripe_charge_id: 1,
        email: 'test@test.com'
      )
      # 2. build line items on @order
      @order.line_items.new(
        product_id: 1,
        quantity: 2,
        item_price_cents: 100,
        total_price_cents: 200
      )
      @order.line_items.new(
        product_id: 2,
        quantity: 2,
        item_price_cents: 200,
        total_price_cents: 400
      )
      # ...
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!


      # 4. reload products to have their updated quantities
      if @order.save
        expected_product_1 = Product.find(@product1.id)
        expected_product_2 = Product.find(@product2.id)
        @order.line_items.each do |x|
          product = Product.find(x.product.id)
          product.quantity -= x.quantity
          product.save
        end
        # byebu
      end
      @product1.reload
      @product2.reload
      expect(@product1.quantity).to eq(8)
      expect(@product2.quantity).to eq(18)
      # 5. use RSpec expect syntax to assert their new quantity values
      # ...
    end
    # pending test 2
    # xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
    # end
  end
end