class User < ApplicationRecord

  has_secure_password

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }

  val_email_reg = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, length: { maximum: 105 },
            format: { with: val_email_reg }

  val_pass_reg = /^[a-zA-Z]\w{7,24}$/g

  validates :password, presence: true, length: { minimum: 8, maximum: 25 },
            format: { with: val_pass_reg }

  validates_confirmation_of :password, message: ": Passwords don't match!"
end
