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
  end
end
