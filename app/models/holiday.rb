class Holiday < ApplicationRecord
    has_many :users
    enum result: { 承認済: true, 未承認: false }
    
end
