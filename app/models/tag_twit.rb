class TagTwit < ActiveRecord::Base
	belongs_to :tag 
	belongs_to :twit
end
