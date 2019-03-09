class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :code
      t.string :name
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
