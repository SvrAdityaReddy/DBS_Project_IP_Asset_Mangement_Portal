class CreateOwns < ActiveRecord::Migration[5.0]
  def change
    create_table :owns do |t|
      t.belongs_to :user, index: true
      t.belongs_to :creation, index: true
      t.float :precentage
      t.string :email

      t.timestamps
    end
  end
end
