class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :destination
      t.float :cost
      t.date :check_in
      t.date :check_out
      t.integer :user_id
      t.integer :hotel_id
    end
  end
end
