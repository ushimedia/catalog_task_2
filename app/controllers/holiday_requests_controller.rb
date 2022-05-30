class HolidayRequestsController < ApplicationController

    def create
        current_user.holiday_requests.create(community_id: apply_params[:community_id])
        redirect_to community_url(apply_params[:community_id]), notice: "有給申請しました"
      end

      private
      def set_attendance
        @attendance = Attendance.find(params[:id])
      end
  
      def attendance_params
        params.require(:attendance).permit(:attendance_time, :leave_office_times)
      end
end
