class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :content
      t.integer :fee
      t.text :address
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
