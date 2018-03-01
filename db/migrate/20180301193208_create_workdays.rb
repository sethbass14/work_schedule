class CreateWorkdays < ActiveRecord::Migration[5.1]
  def change
    create_table :workdays do |t|
      t.date :date
      t.belongs_to :schedule, foreign_key: true
      t.timestamps
    end
  end
end
