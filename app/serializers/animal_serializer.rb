class AnimalSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :animal_photo, :date_of_birth, :weight, :escape_attempts, :owner_id, :genre_id
  attribute :created_at do |animal|
    animal.created_at && animal.created_at.strftime('%m/%d/%Y')
  end
  attribute :updated_at do |animal|
    animal.updated_at && animal.updated_at.strftime('%m/%d/%Y')
  end
end
