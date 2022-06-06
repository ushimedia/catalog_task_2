class LogsController < ApplicationController
    before_action :set_log, only: %i[ show edit update destroy ]
    def import
        Log.import(params[:file])
        @log = Log.where(user_id: nil)
        @log.update(user_id: current_user.id)
        
        redirect_to root_path
      end

      def destroy
        @log.destroy
    
        respond_to do |format|
          format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
          format.json { head :no_content }
        end
      end
      private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end
end
