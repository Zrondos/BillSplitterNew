class GuestsBill < ApplicationRecord
    belongs_to :guest
    belongs_to :bill
end
