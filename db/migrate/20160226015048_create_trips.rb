class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :location
      t.string :description
      t.date :start_date
      t.date :end_date
      t.references :post
      t.references :user

      t.timestamps null: false
    end
  end
end
