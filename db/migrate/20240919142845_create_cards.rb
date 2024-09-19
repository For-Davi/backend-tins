class CreateCards < ActiveRecord::Migration[7.2]
  def up
    create_table :cards, id: :uuid do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :cards
  end
end
