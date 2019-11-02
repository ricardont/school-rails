class ChangeTypeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :appointments, :type, :appointment_type
  end
end
