class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else
     return nil
    end
  end
end

# create_table :users do |t|
#   t.string :first_name
#   t.string :last_name
#   t.string :email
#   t.string :password_digest

#   t.timestamps null: false
# end
