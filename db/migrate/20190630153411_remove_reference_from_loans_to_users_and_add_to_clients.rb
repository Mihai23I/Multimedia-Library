class RemoveReferenceFromLoansToUsersAndAddToClients < ActiveRecord::Migration[5.2]
  def change
    remove_reference :loans, :user, index: true
    add_reference :loans, :client, index: true
  end
end
