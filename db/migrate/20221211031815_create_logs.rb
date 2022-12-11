class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.belongs_to :track, null: false, foreign_key: { to_table: :tracks }
      t.belongs_to :user, null: false, foreign_key: { to_table: :users }
      t.datetime :played_at

      t.timestamps
    end
  end
end
