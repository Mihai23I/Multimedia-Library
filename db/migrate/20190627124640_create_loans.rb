class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.belongs_to :user
      t.belongs_to :physical_item
      t.date :burrow_date, null: false
      t.date :return_date, null: false
      t.string :status

      t.timestamps
    end
  end
end
