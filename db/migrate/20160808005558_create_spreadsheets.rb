class CreateSpreadsheets < ActiveRecord::Migration
  def change
    create_table :spreadsheets do |t|
      t.string :col_a
      t.string :col_b

      t.timestamps null: false
    end
  end
end
