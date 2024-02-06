class Animal < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :genre
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :animal_photo, presence: true
  validates :date_of_birth, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :escape_attempts, presence: true
end
