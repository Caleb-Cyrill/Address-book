class PersonSerializer < ActiveModel::Serializer
    attributes :id, :salutations, :first_name, :last_name, :middle_name, :ssn, :birth_date, :comment, :user_id
end