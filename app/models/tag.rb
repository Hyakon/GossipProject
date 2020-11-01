class Tag < ApplicationRecord

  has_many :potins, through: :join_tags

  validates :title, presence: true, length: { maximum: 30 }

end
