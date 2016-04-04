class AddCommentIdToApprovalVotes < ActiveRecord::Migration
  def change
    add_column :approval_votes, :comment_id, :integer
  end
end
