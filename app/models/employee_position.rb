class EmployeePosition < ApplicationRecord
  belongs_to :employee, :class_name => "User"
  belongs_to :position
end
