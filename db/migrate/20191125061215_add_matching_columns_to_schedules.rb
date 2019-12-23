class AddMatchingColumnsToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :appointment_type, :string
    add_column :schedules, :notes, :text
    add_column :schedules, :enabled, :boolean
  end
end
