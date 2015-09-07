class AddLinkIdToViews < ActiveRecord::Migration
  def change
    add_column :views, :link_id, :integer
  end
end
