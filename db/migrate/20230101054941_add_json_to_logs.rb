class AddJsonToLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :json, :jsonb
  end
end
