class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|

      t.timestamps null: false
    end
  end
end
