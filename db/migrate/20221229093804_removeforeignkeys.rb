class Removeforeignkeys < ActiveRecord::Migration[6.1]
  def change
    remove_column :people, :addresses_id
  end
end
