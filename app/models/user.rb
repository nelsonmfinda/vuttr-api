class User < ApplicationRecord
  has_secure_password

  has_many :tools, foreign_key: :created_by

  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
  validates :name, length: { maximum: 45 }
  validates :email, length: { maximum: 45 }
end
