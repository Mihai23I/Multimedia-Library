class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :physical_item
end
