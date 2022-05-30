class HolidaysController < ApplicationController

def index 
    
        @attendances = Attendance.all
end
    
end
