class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :town, null: false
      t.int :zip_code, null: false
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
