class CreateItemsAndMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :videos do |t|
      t.belongs_to :item

      t.integer :year, null: false
      t.date :released, null: false

      t.string :director, null: false
      t.string :actors, null: false
      t.string :writer, null: false

      t.string :genres, null: false
      t.string :type, null: false

      t.string :awards, null: false

      t.string :rated, null: false

      t.decimal :imdb_rating, null: false
      t.string :imdb_url, null: false
      t.string :trailer_url
      t.string :poster_url


      t.timestamps
    end
  end
end
