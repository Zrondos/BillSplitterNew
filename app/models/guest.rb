class Guest < ApplicationRecord
    has_many :guests_bills
    has_many :bills, through: :guests_bills
end
