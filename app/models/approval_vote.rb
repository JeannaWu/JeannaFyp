class ApprovalVote < ActiveRecord::Base
	belongs_to :post
	belongs_to :comment
end
