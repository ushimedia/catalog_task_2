class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  enum role: { general: 0, superuser: 1, admin: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
