class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :contents
      t.string :movie
      t.string :tag
      t.timestamps
    end
  end
end
