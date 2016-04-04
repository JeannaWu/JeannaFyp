class CreateApprovalDownvotes < ActiveRecord::Migration
  def change
    create_table :approval_downvotes do |t|
      t.integer :post_id
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
