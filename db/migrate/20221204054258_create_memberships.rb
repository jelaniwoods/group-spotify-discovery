class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :group, null: false, foreign_key: { to_table: :groups }
      t.belongs_to :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
