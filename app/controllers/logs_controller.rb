class LogsController < ApplicationController

    def import
        Log.import(params[:file])
        redirect_to attendances_path
      end

      


end
