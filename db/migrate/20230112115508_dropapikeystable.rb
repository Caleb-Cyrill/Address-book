class Dropapikeystable < ActiveRecord::Migration[6.1]
  def change
    drop_table :api_keys
  end
end
