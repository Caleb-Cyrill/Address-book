module API
    module V1
        class People < Grape::API
            include API::V1::Defaults

            resources :people do
                desc "Return all people"
                get "" do
                    Person.all
                end

                desc "Return a person"
                params do
                    requires :id, type: Integer, desc: "ID of the person"  
                end
                get ":id" do
                    Person.find(permitted_params[:id])
                end

                desc "Return people for a single user"
                params do
                    requires :user_id, type: String, desc: "ID of the user"  
                  end
                get "/users/:user_id" do
                    Person.where(user_id: permitted_params[:user_id])
                end

                desc "Create a new person"
                params do 
                    optional :salutations, type: String, values: ["Mr.", "Ms.", "Mrs."], default: "Mr."
                    requires :first_name, type: String, desc: "First name"
                    optional :middle_name, type: String, desc: "Middle name"
                    requires :last_name, type: String, desc: "Last name"
                    optional :ssn, type: String, desc: "Social security number", regexp: /^\d{7}$/
                    requires :birth_date, type: Date, desc: "Birth date" 
                    optional :comment, type: String, desc: "Optional comments"
                    requires :user_id, type: Integer, desc: "Associated user id"
                end
                post "" do
                    if User.exists?(id: params[:user_id])
                        Person.create(declared(params))
                    else
                        {error: "User does not exist"}
                    end
                end

                desc "Edit a person"
                params do 
                    requires :id, type: Integer, desc: "ID of the person"
                    optional :salutations, type: String, values: ["Mr.", "Ms.", "Mrs."], default: "Mr."
                    requires :first_name, type: String, desc: "First name"
                    optional :middle_name, type: String, desc: "Middle name"
                    requires :last_name, type: String, desc: "Last name"
                    optional :ssn, type: String, desc: "Social security number", regexp: /^\d{7}$/
                    optional :comments, type: String, desc: "Optional comments"
                    requires :user_id, type: Integer, desc: "Associated user id"
                end
                put "/:id" do
                    Person.find(permitted_params[:id]).update(permitted_params)
                    {message: 'Person successfully updated'}
                end

                desc "Delete a person"
                params do
                    requires :id, type: Integer, desc: "ID of the person"
                end
                delete "/:id" do
                    Person.find(permitted_params[:id]).destroy
                    {message: "person successfully deleted"}
                end

            end
        end
    end
end