class Item < ApplicationRecord
    has_many :bills_items
    has_many :bills, through: :bills_items
end