class PhoneNumberSerializer < ActiveModel::Serializer
    attributes :id, :phone_number, :comments, :person_id
end