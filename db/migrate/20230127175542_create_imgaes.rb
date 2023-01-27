class CreateImgaes < ActiveRecord::Migration[7.0]
  def change
    create_table :imgaes do |t|
      t.string :title
      t.string :image
      t.string :contents
      t.string :tag

      t.timestamps
    end
  end
end
