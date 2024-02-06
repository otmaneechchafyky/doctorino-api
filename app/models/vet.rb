class Vet < ApplicationRecord
  belongs_to :specialization
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :vet_photo, presence: true
  validates :available_from, presence: true
  validates :available_to, presence: true
  validates :fees, presence: true
  validates :bio, presence: true, length: { minimum: 10, maximum: 500 }
end
