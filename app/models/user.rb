class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true,length: { minimum: 4, maximun: 20 }, format: { without: /\s/ }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, :presence => true,:confirmation => true,:length => {:within => 6..40}
end
