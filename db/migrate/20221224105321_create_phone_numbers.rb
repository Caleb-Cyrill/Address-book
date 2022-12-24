class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.int :phone_number, null: false
      t.string :comment

      t.timestamps
    end
  end
end
