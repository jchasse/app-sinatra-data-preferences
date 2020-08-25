class User < ActiveRecord::Base
    has_secure_password
    has_many :services
    validates :first_name, :last_name, :email, :password,  presence: true
    validates :email, uniqueness: true

  end
  