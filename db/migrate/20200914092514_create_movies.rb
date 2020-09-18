class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name,           null: false
      t.text :explanation,      null: false
      t.integer :category_id,   null: false
      t.references :user,       null: false
      t.timestamps
    end
  end
end