class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties, id: :uuid do |t|
      t.string :name
      t.string :address
      t.integer :floors
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
