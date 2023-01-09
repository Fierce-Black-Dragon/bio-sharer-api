class StaticController  < ApplicationController 
   def home
    render json: {status:200, msg:" it works "}

   end
end
