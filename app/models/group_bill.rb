class GroupBill < ApplicationRecord
    has_many :bills
    has_many :items
    has_one :admin
    has_one_attached :receipt  
end
