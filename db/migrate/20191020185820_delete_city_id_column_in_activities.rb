class DeleteCityIdColumnInActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :city_id, :integer
  end
end
