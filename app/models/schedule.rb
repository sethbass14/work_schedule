class Schedule < ApplicationRecord
  has_many :workdays, dependent: :destroy
  belongs_to :admin, :class_name  => "User"

  # validates :start_date, presence: true, uniqueness: true
  validate :not_in_the_past
  validate :no_overlap_dates

  # validates :not_same_week

  after_create :create_workdays


  def end_date
    # workdays.last.date
    start_date + 6
  end

  private

  def not_in_the_past
    if start_date < Date.today
      errors.add(:start_date, 'Must be today or in the future')
    end
  end

  def no_overlap_dates
    Schedule.where(admin_id: admin_id).where.not(id: id).each do |schedule|
      schedule_dates = schedule.start_date..schedule.end_date
      if schedule_dates === start_date || schedule_dates === end_date
        errors.add(:start_date, 'A new schedule cannot overlap with existing schedules')
      end
    end
  end

  def not_same_week

  end

  def create_workdays
    # if !id
      date = start_date
      7.times do
        workdays << Workday.new(date: date)
        date += 1
      end
    # end
  end

end
