class Lodgings < ActiveRecord::Migration[6.0]
  def change
    create_table :lodgings do |t|
      t.string :category
      t.string :name
      t.string :address
      t.string :website
      t.datetime :departure_date_time
      t.datetime :arrival_date_time
      t.integer :city_id

      t.timestamps
    end
  end
end
