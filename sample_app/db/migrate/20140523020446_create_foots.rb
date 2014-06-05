class CreateFoots < ActiveRecord::Migration
  def change
    create_table :foots do |t|

      t.timestamps
    end
  end
end
