class Email < ApplicationRecord
    belongs_to :person
    validates :email, presence: true, format: { with: /\A^([a-zA-Z0-9])(([\-.]|[_]+)?([a-zA-Z0-9]+))*(@){1}[a-z0-9]+[.]{1}(([a-z]{2,3})|([a-z]{2,3}[.]{1}[a-z]{2,3}))\z/,
    message: 'Invalid email' }
end
