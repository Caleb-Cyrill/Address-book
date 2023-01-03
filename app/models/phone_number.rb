class PhoneNumber < ApplicationRecord
  belongs_to :person
  validates :phone_number, presence: true, format: {with: /\A^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/,
  message: 'Invalid phone number'
}
end
