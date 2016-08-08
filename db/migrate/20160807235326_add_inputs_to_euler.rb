class AddInputsToEuler < ActiveRecord::Migration
  def change
    add_column :eulers, :x, :integer
    add_column :eulers, :y, :integer
  end
end
