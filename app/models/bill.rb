class Bill < ApplicationRecord
    belongs_to :group_bill
    has_many :bills_items
    has_many :items, through: :bills_items
    has_many :guests_bills
    has_many :guests, through: :guests_bills
end
