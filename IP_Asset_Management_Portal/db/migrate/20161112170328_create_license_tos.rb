class CreateLicenseTos < ActiveRecord::Migration[5.0]
  def change
    create_table :license_tos do |t|
      t.belongs_to :creation, index: true
      t.string :name, null: false
      t.integer :uid, null: false
      t.text :license_agreement, null: false
      t.attachment :LIA
      t.boolean :approve
      t.timestamps
    end
  end
end
