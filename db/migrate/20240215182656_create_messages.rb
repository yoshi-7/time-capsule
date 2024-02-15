class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.references :capsule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
