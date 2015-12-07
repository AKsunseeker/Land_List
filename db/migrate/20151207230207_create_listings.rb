class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.text :description
      t.string :zip
      t.integer :square_footage

      t.timestamps null: false
    end
  end
end
