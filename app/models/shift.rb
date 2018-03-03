class Shift < ApplicationRecord
  belongs_to :position

  has_many :employee_shifts
  # has_many :employees

end
