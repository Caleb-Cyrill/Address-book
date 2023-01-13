module API
  module V1
    class APIKeys < Grape::API
      include API::V1::Defaults
      resource :auth do
        desc "Creates and returns access_token if valid login"
        params do
          requires :login, type: String, desc: "Email address"
          requires :password, type: String, desc: "Password"
        end
        post :login do
          user = User.find_by_email(params[:login].downcase)
          if user && user.authenticate(params[:password])
            key = APIKey.create!(user_id: user.id, access_token: SecureRandom.hex)
            {token: key.access_token}
          else
            error!('Unauthorized.', 401)
          end
        end
      
        desc "Returns pong if logged in correctly"
        params do
          requires :token, type: String, desc: "Access token."
        end
        get :ping do
          authenticate!
          { message: "pong" }
        end
      end
    end
	end
end