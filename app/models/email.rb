class Email < ApplicationRecord
    belongs_to :people, optional: true
end
