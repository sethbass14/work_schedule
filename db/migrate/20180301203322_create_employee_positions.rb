class CreateEmployeePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_positions do |t|
      t.integer :employee_id
      t.integer :position_id

      t.timestamps
    end
  end
end
