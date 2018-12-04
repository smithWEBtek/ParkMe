class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :image_url
      t.string :description
      t.string :location
      t.float :price
      t.timestamps
    end
  end
end
