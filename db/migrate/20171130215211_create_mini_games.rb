class CreateMiniGames < ActiveRecord::Migration[5.1]
  def change
    create_table :mini_games do |t|
      t.string :title
      t.string :image
      t.string :serverUrl
      t.string :plugin_name
      t.numeric :maxPlayers
      t.timestamps
    end
  end
end
