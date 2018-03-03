class EmployeeShift < ApplicationRecord
  belongs_to :employee, :class_name => "User"
  belongs_to :shift
  belongs_to :workday
end
