class AddAnswerToEuler < ActiveRecord::Migration
  def change
    add_column :eulers, :answer, :integer
  end
end
