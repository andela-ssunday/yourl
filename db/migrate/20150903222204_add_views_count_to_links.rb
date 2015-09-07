class AddViewsCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :views_count, :integer
  end
end
