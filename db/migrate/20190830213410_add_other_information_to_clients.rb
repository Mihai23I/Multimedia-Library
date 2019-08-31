class AddOtherInformationToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :other_information, :text
  end
end
