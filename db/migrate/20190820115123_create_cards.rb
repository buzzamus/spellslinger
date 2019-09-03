class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :card_type
      t.string :purpose
      t.integer :cmc
      t.integer :blue
      t.integer :red
      t.integer :black
      t.integer :green
      t.integer :white
      t.integer :colorless
      t.timestamps
    end
  end
end
