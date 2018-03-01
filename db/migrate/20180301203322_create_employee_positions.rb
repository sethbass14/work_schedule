class CreateEmployeePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_positions do |t|
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :position, foreign_key: true

      t.timestamps
    end
  end
end
