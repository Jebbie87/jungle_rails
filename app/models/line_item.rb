class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

end

# create_table :line_items do |t|
#   t.references :order, index: true, foreign_key: true
#   t.references :product, index: true, foreign_key: true
#   t.integer :quantity
#   t.integer :item_price_cents
#   t.integer :total_price_cents

#   t.timestamps null: false
# end