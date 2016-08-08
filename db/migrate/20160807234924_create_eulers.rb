class CreateEulers < ActiveRecord::Migration
  def change
    create_table :eulers do |t|

      t.timestamps null: false
    end
  end
end
