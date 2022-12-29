class Address < ApplicationRecord
    belongs_to :people, optional: true
end
