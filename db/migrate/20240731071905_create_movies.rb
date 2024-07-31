class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.string :director
      t.string :cast
      t.text :about
      t.string :category

      t.timestamps
    end
  end
end
