class Job < ActiveRecord::Base
	has_many :tags

	#define_index do
	#  indexes :title
	#  indexes :description
	#end
end
