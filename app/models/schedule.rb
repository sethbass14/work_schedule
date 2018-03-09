class Schedule < ApplicationRecord
  has_many :workdays, dependent: :destroy
  belongs_to :admin, :class_name  => "User"

  validates :start_date, presence: true, uniqueness: true
  validate :not_in_the_past

  # validates :not_same_week

  after_create :create_workdays


  def end_date
    workdays.last.date
  end

  private

  def not_in_the_past
    start_date >= DateTime.now
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
