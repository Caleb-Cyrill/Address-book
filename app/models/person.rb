class Person < ApplicationRecord
    belongs_to :user
    has_many :addresses
    has_many :phone_numbers
    has_many :emails
    accepts_nested_attributes_for :addresses, :phone_numbers, :emails, allow_destroy: true
end

