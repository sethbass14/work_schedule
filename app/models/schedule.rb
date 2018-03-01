class Schedule < ApplicationRecord
  has_many :workdays, dependent: :destroy

  after_save :create_workdays

  private

  def create_workdays
    date = start_date
    num = 7
    while num > 0
      self.workdays << Workday.new(date: date)
      date += 1
      num -= 1
    end
  end

end
