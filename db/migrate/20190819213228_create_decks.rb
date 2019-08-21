class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :format
      t.boolean :singleton_valid, default: true
      t.timestamps
    end
  end
end
