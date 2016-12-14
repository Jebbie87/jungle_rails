class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  # after_create :decrease_product_quantity


  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  # def decrease_product_quantity
  #   self.line_items.each do |x|
  #     byebug
  #     product = Product.find(x.product_id)
  #     product.quantity -= x.quantity
  #     product.save
  #   end
  # end

end

# create_table :orders do |t|
#   t.integer :total_cents
#   t.timestamps null: false
# end

