class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

end

# create_table :users do |t|
#   t.string :first_name
#   t.string :last_name
#   t.string :email
#   t.string :password_digest

#   t.timestamps null: false
# end
