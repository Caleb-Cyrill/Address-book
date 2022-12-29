class AddPhoneNumbersToPeople < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :phone_numbers, null: false, foreign_key: true
  end
end
