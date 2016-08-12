class Tag < ActiveRecord::Base
	has_many :tag_twits
	has_many :twits, through: :tag_twits
end
