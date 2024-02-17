class AddStatusToCapsule < ActiveRecord::Migration[7.0]
  def change
    add_column :capsules, :status, :string, default: 'draft'
  end
end
