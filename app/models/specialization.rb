class Specialization < ApplicationRecord
    has_many :vets

    validates :name, presence: true
end
