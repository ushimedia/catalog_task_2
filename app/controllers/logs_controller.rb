class LogsController < ApplicationController

    def import
        Log.import(params[:file])
        @log = Log.where(user_id: nil)
        @log.update(user_id: current_user.id)
        @log.Log.where(user_id: nil)
        redirect_to root_path
      end


end
