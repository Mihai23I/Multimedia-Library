class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :phone, limit: 15
      t.string :address
      t.string :unique_identifier_code

      t.timestamps
    end

    remove_column :users, :name, :string
    remove_column :users, :address, :string
    remove_column :users, :phone, :string
    add_reference :users, :client, index: true
  end
end
