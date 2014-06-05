class CreateDeers < ActiveRecord::Migration
  def change
    create_table :deers do |t|

      t.timestamps
    end
  end
end
