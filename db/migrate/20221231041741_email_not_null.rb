class EmailNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :emails, :email, false
  end
end
