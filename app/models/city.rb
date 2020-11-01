class City < ApplicationRecord

  has_many :users

  validates :zip_code, length: { maximum: 15 }, format: { with: /[[:digit:]]/, message: 'Number Only' }
  validates :name, presence: true

end
