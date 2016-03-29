class CreateApprovalVotes < ActiveRecord::Migration
  def change
    create_table :approval_votes do |t|
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
