class Company < ApplicationRecord
  # has_many :users
  has_many :employees, :class_name => "User"
end
