class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :salutations
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :ssn
      t.date :birth_date
      t.string :comment

      t.timestamps
    end

    create_table :emails do |t|
      t.string :email
      t.string :comments
      t.string :person_id
  
      t.timestamps
    end  
     
    create_table :phone_numbers do |t|
      t.integer :phonenumber
      t.string :comments
      t.integer :people_id
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
    add_index :emails, :person_id
    add_index :phone_numbers, :people_id

  end
end
