class Message < ApplicationRecord
	belongs_to :user
	validates :content, presence: true

	before_validation :strip_whitespace

	private

	def strip_whitespace
     self.content = self.content.strip unless self.content.nil?
    end

end
