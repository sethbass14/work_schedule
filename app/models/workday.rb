class Workday < ApplicationRecord
  belongs_to :schedule

  has_many :employee_shifts
  has_many :employees, through: :employee_shifts
  has_many :shifts, through: :employee_shifts
end
