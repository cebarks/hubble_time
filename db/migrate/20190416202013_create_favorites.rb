class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :hubble_id
      t.string :name
      t.string :description
      t.string :credits
      t.string :file_url

      t.timestamps
    end
  end
end
