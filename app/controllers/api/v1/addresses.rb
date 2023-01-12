module API
    module V1
        class Addresses < Grape::API
            include API::V1::Defaults
            default_format :json
            format :json

            resources :people do
                route_param :person_id, type: Integer do
                    desc "Create a new address"
                    params do
                            requires :street, type: String, desc: "Name of street and house number"
                            requires :town, type: String, desc: "Name of town", regexp: /^[a-zA-Z\s]*$/
                            requires :zip_code, type: Integer, desc: "Zip code", regexp: /^\d{5}$/
                            optional :state, type: String, desc: "name of the state", regexp: /^[a-zA-Z\s]*$/
                            optional :country, type: String, desc: "name of the country", regexp: /^[a-zA-Z\s]*$/
                    end
                    post "/address" do
                        if Person.exists?(id: params[:person_id]) 
                            Address.create!(declared(params))
                        else
                            {message: "Person does not exist"}
                        end
                    end

                    desc "Edit an address"
                    params do
                            requires :person_id, type: Integer, desc: "ID of the person"
                            requires :street, type: String, desc: "Name of street and house number"
                            requires :town, type: String, desc: "Name of town", regexp: /^[a-zA-Z\s]*$/
                            requires :zip_code, type: Integer, desc: "Zip code", regexp: /^\d{5}$/
                            optional :state, type: String, desc: "name of the state", regexp: /^[a-zA-Z\s]*$/
                            optional :country, type: String, desc: "name of the country", regexp: /^[a-zA-Z\s]*$/
                            requires :id, type: Integer, desc: "ID of address"
                    end
                    put "/address/:id" do
                        Address.find(params[:id]).update(params)
                    end

                    desc "Get an address"
                    params do
                        requires :id, type: Integer, desc: "ID of the person"
                    end
                    get "/address/:id" do
                        Address.find(params[:id])
                    end

                    desc "Get all Addresses for person"
                    get "/address" do
                        Address.where(person_id: params[:person_id])
                    end

                    desc "Delete an address"
                    params do
                        requires :id, type: Integer, desc: "ID of the person"
                    end
                    delete "/address/:id" do
                        Address.find(params[:id]).destroy
                        if Address.exists?(params[:id])
                            {error: "Something went wrong try again"}
                        else 
                            {message: "Address successfully deleted"}
                        end
                    end

                end
            end
        end
    end
end
