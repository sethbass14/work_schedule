class Schedule < ApplicationRecord
  has_many :workdays, dependent: :destroy
  belongs_to :admin, class_name: "User"

  validates :start_date, presence: true, uniqueness: true

  after_save :create_workdays

  private

  def create_workdays
    date = start_date
    7.times do
      workdays << Workday.new(date: date)
      date += 1
    end
  end

end
