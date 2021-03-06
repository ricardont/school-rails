 class Event
    def self.date_range (date_range={})
        today = DateTime.now.to_date
        start_date = date_range[:start_date].nil?  ? "#{today} 00:00:00" : date_range[:start_date] 
		end_date   = date_range[:end_date].nil? ? "#{today} 23:59:59" : date_range[:end_date] 
        end_date_appt    = "#{(today - 1)} 23:59:59"
        start_date_sched = "#{today} 00:00:00"
        if ( end_date.to_datetime < today )
            Appointment.range({start_date: start_date, end_date:end_date})
        elsif ( start_date.to_datetime > today )
            Schedule.range({start_date: start_date, end_date:end_date})
        else
            today_schedules   = Schedule.range({start_date: start_date_sched, end_date:end_date})
            today_appointments = Appointment.range({start_date: start_date, end_date:end_date})
            schedules_saved_exclude_today = today_appointments.select(:schedule_id)
            today_appointments + today_schedules.where.not(id: schedules_saved_exclude_today)  
        end
    end
end