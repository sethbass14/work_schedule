class User < ApplicationRecord
  belongs_to :company
  has_many :employee_positions, :foreign_key => "employee_id"
  has_many :positions, through: :employee_positions
  has_many :schedules, :foreign_key => "admin_id"

end
