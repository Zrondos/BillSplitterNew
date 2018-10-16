class BillsItem < ApplicationRecord
    belongs_to :items
    belongs_to :bills
end
