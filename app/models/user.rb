class User < ApplicationRecord

  belongs_to :city

  has_many :reviews
  has_many :gossips
  has_many :sent_messages, class_name: "PrivateMessage"
  has_many :received_messages, class_name: "PrivateMessage", through: :join_pms
  has_many :likes

  has_secure_password

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :age, length: { is: 2 }, format: { with: /[[:digit:]]/, message: 'Number Only' }

end
