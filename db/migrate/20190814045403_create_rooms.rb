class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms, id: :uuid do |t|
      t.string :name, null: false
      t.jsonb :image_data
      t.references :property, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
