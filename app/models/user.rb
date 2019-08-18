class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :city, length: { maximum: 50 }
  validates :address, length: { maximum: 255 }
  validates :phone, length: { is: 10 }, allow_nil: true
  has_secure_password
  validates :password, length: { minimum: 6 }
end
