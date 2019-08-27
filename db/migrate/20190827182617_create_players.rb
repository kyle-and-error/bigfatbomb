class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :email
      t.string :name
      t.string :nickname
      t.string :year
      t.string :exec_position
      t.string :position
      t.integer :height
      t.integer :weight
      t.string :hometown
      t.text :fun_fact
      t.text :fatal_flaw
      t.text :duck_or_horses
      t.string :song
      t.string :picture_url


      t.timestamps
    end
  end
end
