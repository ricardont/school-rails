class EventsController < ApplicationController
    def day 
        @events = Schedule.range(date_range_params) 
    end
    def date_range_params
        params.permit(:start_date, :end_date)
    end
end
