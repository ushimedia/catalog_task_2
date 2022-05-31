class HolidaysController < ApplicationController
    before_action :set_holiday, only: %i[ show edit update destroy ]

def index 
    @holidays = Holiday.all
end

def new
    @holidays = Holiday.all
  end

def create
    @holiday = Holiday.new(holiday_params)
   # @holiday.user = current_user
    respond_to do |format|
      if @holiday.save
        format.html { redirect_to new_holiday_path(@holiday), notice: "有給申請しました" }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to new_holiday_path(@holiday), notice: "Attendance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_holiday
    @holiday = Holiday.find(params[:id])
  end
 
  def holiday_params
    params.permit(:paid_holiday, :result, :approver)
  end
  
end
