class Article < ApplicationRecord
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings
	
	def tag_list
		self.tags.collect do |t|
			t.name
		end.join(', ')
	end

	def tag_list=(tags)
		tags = tags.split(',').collect {|s| s.strip.downcase}.uniq
		tags.collect! {|name| Tag.find_or_create_by(name: name)}
		self.tags = tags
	end

end
