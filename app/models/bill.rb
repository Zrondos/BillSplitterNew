class Bill < ApplicationRecord
    belongs_to :group_bill
    has_many :bills_items
    has_many :items, through: :bills_items
    has_many :users_bills
    has_many :users, through: :users_bills
end
