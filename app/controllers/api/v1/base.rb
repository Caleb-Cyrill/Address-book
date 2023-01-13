module API
    module V1
      class Base < Grape::API
        mount API::V1::Users
        mount API::V1::People
        mount API::V1::Addresses
        mount API::V1::Emails
        mount API::V1::PhoneNumbers
        mount API::V1::APIKeys
      end
    end
end