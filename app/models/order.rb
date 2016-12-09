class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end

# create_table :orders do |t|
#   t.integer :total_cents
#   t.timestamps null: false
# end

