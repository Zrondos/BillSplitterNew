class CreateBillsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bills_items do |t|

      t.timestamps
    end
  end
end
