class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :email
      t.integer :city_id
      t.string :other

      t.timestamps
    end
  end
end
