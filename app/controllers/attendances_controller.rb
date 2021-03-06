class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]
 
  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
    attendances = @attendances
    @attendances = current_user.attendances
    @user = current_user
    @attendance = Attendance.new
    
    
  end  

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  def import
    Attendance.import(params[:file], current_user.id)
    redirect_to root_path
  end


  

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user = current_user
   
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendances_path(@attendance), notice: "今日も一日お疲れさまでした！" }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html {  
          redirect_to attendances_path(@attendance), notice: "登録したい勤怠日が重複しているか、出勤・退勤時刻の前後に間違いがある可能性があります。また打刻時間を変更したい場合は修正からお願いいたします。"
      }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to attendances_path(@attendance), notice: "勤怠の修正が完了いたしました。" }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url, notice: "登録を削除いたしました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

   

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:attendance_time, :leave_office_time,:attendance_date )
    end

end
