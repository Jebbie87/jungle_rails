class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def average_review
    if self.reviews.count > 0
      self.reviews.sum(:rating) / self.reviews.count
    else
      'No ratings just yet!'
    end
  end

  def is_sold_out?
    if self.quantity === 0
      true
    else
      false
    end
  end

end

# create_table :products do |t|
#   t.string :name
#   t.text :description
#   t.string :image
#   t.integer :price_cents
#   t.integer :quantity

#   t.timestamps null: false
# end