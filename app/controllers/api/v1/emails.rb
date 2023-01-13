module API
    module V1
        class Emails < Grape::API
            include API::V1::Defaults
            default_format :json
            format :json

            resources :people do
                route_param :person_id, type: Integer do
                    desc "Create a new email"
                    params do
                            requires :email, type: String, desc: "Email address"
                            optional :comments, type: String, desc: "Optional comments"
                    end                            
                    post "/email" do
                        authenticate!
                        if Person.exists?(id: params[:person_id]) 
                            Email.create!(declared(params))
                        else
                            {message: "Person does not exist"}
                        end
                    end

                    desc "Edit an email"
                    params do
                        requires :email, type: String, desc: "Email address"
                        optional :comments, type: String, desc: "Optional comments"
                    end
                    put "/email/:id" do
                        authenticate!
                        Email.find(params[:id]).update(params)
                    end

                    desc "Get an email"
                    params do
                        requires :id, type: Integer, desc: "ID of the person"
                    end
                    get "/email/:id" do
                        authenticate!
                        Email.find(params[:id])
                    end

                    desc "Get all emails for person"
                    get "/email" do
                        authenticate!
                        Email.where(person_id: params[:person_id])
                    end

                    desc "Delete an email"
                    params do
                        requires :id, type: Integer, desc: "ID of the person"
                    end
                    delete "/email/:id" do
                        authenticate!
                        Email.find(params[:id]).destroy
                        if Email.exists?(params[:id])
                            {error: "Something went wrong try again"}
                        else 
                            {message: "Email successfully deleted"}
                        end
                    end
                end
            end
        end
    end
end
