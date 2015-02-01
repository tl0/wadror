class User < ActiveRecord::Base
  include RatingAverage

  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 3 }, format: { with: /([a-zA-Z+]+[0-9+]+)/, message: "must containt atleast one capita and one number" }

  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_and_belongs_to_many :beer_clubs
  has_secure_password
end
