class Loan < ApplicationRecord
  belongs_to :client
  belongs_to :physical_item
  before_save :default_values

  enum status: { active: "Activ", rejected: "Rejectat", cancelled: "Anulat", burrowed: "Imprumutat", returned: "Returnat" }

  validates :burrow_date, presence: true
  validates :return_date, presence: true
  validate :available_dates

  def default_values
    self.status ||= :active
  end

  def available_dates
    if burrow_date > return_date
      errors.add(:Perioada, ' gresit introdusa')
    end
    if burrow_date < Date.today
      errors.add(:Perioada, ' gresit introdusa')
    end
    Loan.where("physical_item_id = ?", physical_item_id).each do |loan|
      this_period = (burrow_date..return_date)
      loan_period = (loan.burrow_date..loan.return_date)
      if this_period.overlaps?(loan_period)
        errors.add(:Obiectul, "nu este valabil in perioada respectiva #{loan.burrow_date} - #{loan.return_date}") unless loan.id == id
      end
    end
  end
end
