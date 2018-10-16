class CreateGuestsBills < ActiveRecord::Migration[5.2]
  def change
    create_table :guests_bills do |t|

      t.timestamps
    end
  end
end
