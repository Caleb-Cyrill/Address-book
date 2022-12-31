class Address < ApplicationRecord
    belongs_to :person, optional: true
    validates :street, presence: true
    validates :town, presence: true, format: { with: /\A[a-zA-Z]+\z/,
        message: "letters only" }
    validates :zip_code, presence: true
end