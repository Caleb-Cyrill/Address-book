class EmailSerializer < ActiveModel::Serializer
    attributes :id, :email, :comments, :person_id
end