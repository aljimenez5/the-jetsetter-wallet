class Activities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :city_id
    end
  end
end
