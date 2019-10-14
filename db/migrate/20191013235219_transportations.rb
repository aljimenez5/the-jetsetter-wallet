class Transportations < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations do |t|
      t.string :category
      t.string :company
      t.datetime :departure_date_time
      t.datetime :arrival_date_time
      t.integer :departure_city_id
      t.integer :arrival_city_id

      t.timestamps
    end
  end
end
