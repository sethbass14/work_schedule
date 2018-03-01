class Position < ApplicationRecord
  has_many :employee_positions
  has_many :employees, :class_name => 'User', through: :employee_positions
end
