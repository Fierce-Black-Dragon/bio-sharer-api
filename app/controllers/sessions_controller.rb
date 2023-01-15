class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User
            .find_by(email: params["user"]["email"])
            .try(:authenticate, params["user"]["password"])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
    
      render json: {
        logged_in: true,
        user:  UserSerializer.new(@current_user).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end

 def update
  user = User.find(params[:id])
  if user
  user.avatar.attach(params[:avatar])
  user.full_name = params[:full_name]
  user.info = params[:info]
  user.save
  render json: {
  status: 200,
  message: "Profile updated successfully",
  user: user
  }
  else
  render json: {
  status: 401,
  message: "Unauthorized"
  }
  end
 end
end