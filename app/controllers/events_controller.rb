class EventsController < ApplicationController
    def day 
        @events = Schedule.range(date_range_params) 
        @start_date = date_range_params[:start_date]
        @end_date   = date_range_params[:end_date]

    end
    private
    def date_range_params
        params.permit(:start_date, :end_date)
    end
end
