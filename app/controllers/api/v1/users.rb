module API
    module V1
      class Users < Grape::API
            include API::V1::Defaults
            default_format :json
            format :json

            desc "Create new user"
              params do
                requires :email, type: String, desc: "email of user", regexp: /\A^([a-zA-Z0-9])(([\-.]|[_]+)?([a-zA-Z0-9]+))*(@){1}[a-z0-9]+[.]{1}(([a-z]{2,3})|([a-z]{2,3}[.]{1}[a-z]{2,3}))\z/
                requires :password, type: String, desc: "password of user"
              end
              post "users/new" do
                User.create(declared(params))
              end
            
            desc "Get all users"
              get "users" do
                authenticate!
                User.all
              end
            
            desc "Return a user"  
              params do
                requires :id, type: Integer, desc: "ID of the user"  
              end
              get "users/:id" do
                authenticate!
                User.find(permitted_params[:id])
              end
            
            desc "Delete a user"  
              params do
                requires :id, type: Integer, desc: "ID of the user"  
              end
              delete "users/:id" do
                authenticate!
                User.find(permitted_params[:id]).destroy
                {message: 'user successfully deleted'}
              end

            desc "Edit a user"
            params do
              requires :email, type: String, desc: "email of user", regexp: /\A^([a-zA-Z0-9])(([\-.]|[_]+)?([a-zA-Z0-9]+))*(@){1}[a-z0-9]+[.]{1}(([a-z]{2,3})|([a-z]{2,3}[.]{1}[a-z]{2,3}))\z/
              requires :password, type: String, desc: "password of user"
              requires :id, type: Integer, desc: "ID of the user"
            end
            put "users/:id/edit" do
              authenticate!
              User.find(permitted_params[:id]).update(permitted_params)
              User.find(permitted_params[:id])
            end
          
      end
    end
end

