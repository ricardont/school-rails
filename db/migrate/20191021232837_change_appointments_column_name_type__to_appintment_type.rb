class ChangeAppointmentsColumnNameTypeToAppintmentType < ActiveRecord::Migration[5.2]
  def up
    add_column :appointments, :appointment_type, :string
  end
  def down
    remove_column  :appointments, :type
  end
end
