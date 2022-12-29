class Dropnamefromuser < ActiveRecord::Migration[6.1]
  def change
    remove_columns :users, :first_name, :last_name
  end
end
