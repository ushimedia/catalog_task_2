class LogsController < ApplicationController

    def import
        Log.import(params[:file])
        redirect_to root_path
      end


end
