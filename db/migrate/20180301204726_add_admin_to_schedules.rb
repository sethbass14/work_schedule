class AddAdminToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :admin_id, :integer
  end
end
