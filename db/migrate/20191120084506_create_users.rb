class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :myUUID
      t.string :partnerUUID
      t.float :latitude
      t.float :longitude
      t.string :randomCode

      t.timestamps
    end
  end
end
