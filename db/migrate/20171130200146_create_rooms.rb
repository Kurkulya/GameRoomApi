class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :image
      t.string :gameServer
      t.numeric :maxPlayers
      t.numeric :currentPlayers
      t.timestamps
    end
  end
end
