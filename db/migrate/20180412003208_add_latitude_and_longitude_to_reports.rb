class AddLatitudeAndLongitudeToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :latitude, :float
    add_column :reports, :longitude, :float
  end
end
