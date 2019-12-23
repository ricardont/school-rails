class EventsController < ApplicationController
    def diary          
        @events =  Event.date_range(date_range_params)
        @start_date = date_range_params[:start_date]
        @end_date   = date_range_params[:end_date]
    end
    private
    def date_range_params
        params.permit(:start_date , :end_date)
    end
end
