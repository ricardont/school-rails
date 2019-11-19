class AddSheduleIdToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :schedule_id, :integer
  end
end
