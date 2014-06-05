class CreateSheep < ActiveRecord::Migration
  def change
    create_table :sheep do |t|

      t.timestamps
    end
  end
end
