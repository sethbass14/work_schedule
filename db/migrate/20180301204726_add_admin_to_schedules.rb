class AddAdminToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_reference :schedules, :admin, foreign_key: true
  end
end
