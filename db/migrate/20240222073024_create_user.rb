class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
