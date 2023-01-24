class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.integer :phonenumber
      t.string :comments
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
    change_column_null :people, :first_name, false
    change_column_null :people, :last_name, false
    change_column_null :addresses, :street, false
    change_column_null :addresses, :town, false
    change_column_null :addresses, :zip_code, false
  end
end
