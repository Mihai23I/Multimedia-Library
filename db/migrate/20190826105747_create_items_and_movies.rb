class CreateItemsAndMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name

      t.timestamps
    end

    create_table :movies do |t|
      t.belongs_to :item

      t.integer :year
      t.date :released

      t.string :director
      t.string :actors
      t.string :writer

      t.string :genres
      t.string :type

      t.string :awards

      t.string :rated

      t.decimal :imdb_rating
      t.string :imdb_url
      t.string :trailer_url
      t.string :poster_url


      t.timestamps
    end
  end
end
