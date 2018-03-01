class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.string :name
      t.belongs_to :company, foreign_key: true
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
