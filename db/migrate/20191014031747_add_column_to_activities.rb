class AddColumnToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :trip_id, :integer
  end
end
