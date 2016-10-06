class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string, :name
      t.string :current_city
      t.datetime :join_date

      t.timestamps
    end
  end
end
