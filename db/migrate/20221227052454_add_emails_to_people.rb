class AddEmailsToPeople < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :emails, null: false, foreign_key: true
  end
end
