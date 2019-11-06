class DiaryController < ApplicationController
    def day 
=begin        
         start_date = params[:start_date].nil? ? DateTime.now.beginning_of_day : params[:start_date]
        end_date = start_date + 1 
        p start_date
        @schedules = Schedule.date_range(start_date, end_date) 
=end
        @schedules = Schedule.all
    end
    private
    def student_params
        params.require(:student).permit(:start_date, :end_date)
    end
end
