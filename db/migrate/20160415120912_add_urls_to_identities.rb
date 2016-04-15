class AddUrlsToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :urls, :string
  end
end
