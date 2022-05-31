class Holiday < ApplicationRecord
    has_many :users
    enum result: { 承認済: true, 未承認: false }
    enum approver: { 堂島大吾: 2, へっぽこ: 0 }
end
