class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, presence: true, numericality: true, inclusion: { in: 0..5 }

end

# create_table :reviews do |t|
#   t.references :product, index: true, foreign_key: true
#   t.references :user, index: true, foreign_key: true
#   t.text :description
#   t.integer :rating

#   t.timestamps null: false
# end
