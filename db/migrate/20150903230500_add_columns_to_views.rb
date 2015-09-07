class AddColumnsToViews < ActiveRecord::Migration
  def change
    add_column :views, :referrer, :string
    add_column :views, :request_ip, :string
  end
end
