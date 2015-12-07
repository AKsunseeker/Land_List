class CreateRealtors < ActiveRecord::Migration
  def change
    create_table :realtors do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
