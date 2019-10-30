class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.integer :user_id
      t.text :first_name
      t.text :last_name

      t.timestamps
    end
  end
end
