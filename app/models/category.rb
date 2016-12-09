class Category < ActiveRecord::Base

  has_many :products

end

# create_table :categories do |t|
#   t.string :name

#   t.timestamps null: false
# end