class Wine < ApplicationRecord
    validates :name, presence: true
end
