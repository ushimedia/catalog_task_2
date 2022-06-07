class Log < ApplicationRecord
    belongs_to :user
    has_many :attendances, through: :user
   
end
