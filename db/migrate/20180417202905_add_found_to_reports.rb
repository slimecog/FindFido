class AddFoundToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :found, :boolean, default: false
  end
end
