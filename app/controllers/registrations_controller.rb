class RegistrationsController < ApplicationController
  def create
    user = User.new(
      email: params['user']['email']
    )
    user.password = params['user']['password']
    user.password_confirmation = params['user']['password_confirmation']
    user.save
    user.username = params['user']['username']

    if user.save
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 500 }
    end
  end
end
