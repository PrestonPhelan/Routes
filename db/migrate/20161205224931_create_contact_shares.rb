class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_column :contacts, :created_at, :updated_at
    add_index :contact_shares, [:contact_id, :user_id], unique: true
  end
end
