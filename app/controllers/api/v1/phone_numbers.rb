module API
    module V1
        class PhoneNumbers < Grape::API
            include API::V1::Defaults
            default_format :json
            format :json

            resources :people do
                route_param :person_id, type: Integer do
                    desc "Create a new phone number"
                    params do
                            requires :phone_number, type: String, desc: "Phone number"
                            optional :comments, type: String, desc: "Optional comments"
                    end                            
                    post "/phone" do
                        if Person.exists?(id: params[:person_id]) 
                            PhoneNumber.create!(declared(params))
                        else
                            {message: "Person does not exist"}
                        end
                    end

                    desc "Edit a phone number"
                    params do
                        requires :phone_number, type: String, desc: "Phone number"
                        optional :comments, type: String, desc: "Optional comments"
                    end
                    put "/phone/:id" do
                        PhoneNumber.find(params[:id]).update(params)
                    end

                    desc "Get a phone number"
                    params do
                        requires :id, type: Integer, desc: "ID of phone number"
                    end
                    get "/phone/:id" do
                        PhoneNumber.find(params[:id])
                    end

                    desc "Get all phone numbers for person"
                    get "/phone" do
                        PhoneNumber.where(person_id: params[:person_id])
                    end

                    desc "Delete a phone number"
                    params do
                        requires :id, type: Integer, desc: "ID of phone number"
                    end
                    delete "/phone/:id" do
                        PhoneNumber.find(params[:id]).destroy
                        if PhoneNumber.exists?(params[:id])
                            {error: "Something went wrong try again"}
                        else 
                            {message: "Phone number successfully deleted"}
                        end
                    end
                end
            end
        end
    end
end
