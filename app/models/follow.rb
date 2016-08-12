class Follow < ActiveRecord::Base
	belongs_to :profile, foreign_key: :follower_id
	belongs_to :following, class_name: 'Profile'
end
