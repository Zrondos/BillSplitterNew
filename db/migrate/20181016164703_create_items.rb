class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.money :price
      t.integer :group_bill_id


      t.timestamps
    end
  end
end
