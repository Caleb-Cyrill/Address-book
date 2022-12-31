class Person < ApplicationRecord
    belongs_to :user
    has_many :addresses, dependent: :destroy
    has_many :phone_numbers, dependent: :destroy
    has_many :emails, dependent: :destroy
    accepts_nested_attributes_for :addresses, :phone_numbers, :emails, allow_destroy: true
    validates :first_name, presence: true
    validates :last_name, presence: true
end

