class EventsController < ApplicationController
    def day 
        @events = Schedule.range(date_range_params) 
    end
    private
    def get_dow_events
        Schedule.range(date_range_params).map {
            start_date
        } 
    end
    def date_range_params
        params.permit(:start_date, :end_date)
    end
end
