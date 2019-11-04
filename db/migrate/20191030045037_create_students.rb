class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :user_id
      t.text :first_name
      t.text :last_name
      t.integer :age
      t.integer :phone
      t.text :address
      t.timestamps
    end
  end
end
