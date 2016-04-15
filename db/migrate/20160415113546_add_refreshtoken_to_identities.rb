class AddRefreshtokenToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :refreshtoken, :string
  end
end
