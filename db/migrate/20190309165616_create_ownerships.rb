class CreateOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :ownerships do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :movie_id , :type], unique: true
    end
  end
end
