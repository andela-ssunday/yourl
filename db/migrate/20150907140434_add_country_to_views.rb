class AddCountryToViews < ActiveRecord::Migration
  def change
    add_column :views, :country, :string
  end
end
