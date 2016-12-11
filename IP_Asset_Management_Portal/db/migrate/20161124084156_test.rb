class Test < ActiveRecord::Migration[5.0]
  def change
  	change_table :creations do |t|
  		t.integer :approver
  	end
  end
end
