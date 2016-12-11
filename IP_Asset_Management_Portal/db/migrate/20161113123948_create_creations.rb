class CreateCreations < ActiveRecord::Migration[5.0]
  def change
    create_table :creations do |t|
      t.string :title
      t.string :tp
      t.string :proposal
      t.integer :creator_id
      t.integer :royalty, null: false, default: 0
      t.integer :liabilities, null: false, default: 0
      t.string :ip_policy
      t.integer :ip_flag, null: false, default: 0

      t.timestamps
    end
  end
end
