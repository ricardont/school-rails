class EventsController < ApplicationController
    def diary          
        @events =  Event.date_range(date_range_params)
        @header = dynamic_header(date_range_params[:start_date], date_range_params[:end_date])
    end
    private
    def dynamic_header(start_date = DateTime.now, end_date = DateTime.now) 
        end_date_hd = (end_date.to_date - start_date.to_date) > 0 ? "a #{end_date.to_date}" : "" 
        prefix = "Registro diario diario"
        sufix  = ((start_date == DateTime.now ) && ( end_date == DateTime.now)) ?  " de Hoy" :  ": #{start_date.to_date} #{end_date_hd.to_date}" 
        "#{prefix} #{sufix}"
    end
    def date_range_params
        params.permit(:start_date , :end_date)
    end
end
