class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :admin, default: 0
      t.string :city
      t.string :phone, limit: 12
      t.string :address

      t.index :email, unique: true
      t.timestamps
    end
  end
end
