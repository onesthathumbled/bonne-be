class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

    has_many :categories
    has_many :tasks

    # validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :encrypted_password, presence: true
    # validates :password, presence: true
    # validates :first_name, presence: true
    # validates :last_name, presence: true

    # Role definition
    enum role: [:user, :admin]
end
