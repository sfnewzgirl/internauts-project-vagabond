class User < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :current_city
      t.datetime :join_date
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end