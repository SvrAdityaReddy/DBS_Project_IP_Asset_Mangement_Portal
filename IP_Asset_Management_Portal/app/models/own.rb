class Own < ApplicationRecord
	belongs_to :user, :foreign_key => 'user_id'
	belongs_to :creation, :foreign_key => 'creation_id'
end
