class CreateWorkdays < ActiveRecord::Migration[5.1]
  def change
    create_table :workdays do |t|
      t.date :date
      t.integer :schedule_id
      t.timestamps
    end
  end
end
