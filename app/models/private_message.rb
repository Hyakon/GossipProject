class PrivateMessage < ApplicationRecord

  belongs_to :sender, class_name: "User"

  has_many :recipients, class_name: "User", through: :join_pms

  validates :content, presence: true

end
