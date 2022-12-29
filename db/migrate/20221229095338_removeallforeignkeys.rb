class Removeallforeignkeys < ActiveRecord::Migration[6.1]
  def change
    remove_columns :people, :emails_id, :phone_numbers_id
  end
end
