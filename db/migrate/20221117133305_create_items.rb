class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :image
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
