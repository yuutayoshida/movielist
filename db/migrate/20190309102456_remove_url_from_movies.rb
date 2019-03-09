class RemoveUrlFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :url, :string
  end
end
