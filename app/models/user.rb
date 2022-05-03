class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
    
  has_many :addresses, inverse_of: :user
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  has_many :posts

  accepts_nested_attributes_for :posts


end
