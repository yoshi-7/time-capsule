class CreateUserCapsules < ActiveRecord::Migration[7.0]
  def change
    create_table :user_capsules do |t|
      t.references :user, null: false, foreign_key: true
      t.references :capsule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
