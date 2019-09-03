class AddDecksIdToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :deck_id, :integer
  end
end
