class PhoneNumber < ApplicationRecord
    belongs_to :people, optional: true
end
