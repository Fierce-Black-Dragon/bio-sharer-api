class DashboardController < ApplicationController
    def set_user
        begin
            @user = User.find_by(username: params[:id])
        rescue  StandardError
            @user = nil
        end
       render json: {
        status: :created,
        user:   UserSerializer.new(@user).serializable_hash[:data][:attributes]
      }
    end 
end 
