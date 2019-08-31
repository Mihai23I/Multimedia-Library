class CreateGlobalSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :global_settings do |t|
      t.string :application_name, null: false, default: "Biblioteca Multimedia"
      t.integer :maximum_days_for_burrowing, null: false, default: 30
      t.integer :maximum_items_per_client, null: false, default: 10

      t.timestamps
    end
  end
end
