class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :street
      t.string :city
      t.string :zip
      t.text :description

      t.timestamps
    end
  end
end
