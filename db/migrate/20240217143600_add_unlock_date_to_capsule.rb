class AddUnlockDateToCapsule < ActiveRecord::Migration[7.0]
  def change
    add_column :capsules, :unlock_date, :date
  end
end
