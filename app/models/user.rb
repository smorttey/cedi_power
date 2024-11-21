class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_secure_password
  
    has_many :saved_items, dependent: :destroy
    has_many :search_histories, dependent: :destroy
  
    enum :role, { admin: 0, general_user: 1, store_owner: 2 }
  
    validates :email, presence: true, uniqueness: true
  end
  