class Gossip < ApplicationRecord

  belongs_to :user

  has_many :tags, through: :join_tags
  has_many :reviews
  has_many :likes

  validates :title, presence: true, length: { in: 3..54 }
  validates :content, presence: true

end
