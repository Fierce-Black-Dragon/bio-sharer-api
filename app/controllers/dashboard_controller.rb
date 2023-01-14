class DashboardController < ApplicationController

    def set_user
    
        begin
            @user= User.friendly.find(params[:id])
        rescue  StandardError
            @user = nil
        end
       render json: {
        status: :created,
        user:  @user
      }
    end 
end  