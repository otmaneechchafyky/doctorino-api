class AnimalSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :animal_photo, :date_of_birth, :weight, :escape_attempts
  attribute :created_at do |animal|
    animal.created_at && animal.created_at.strftime('%m/%d/%Y')
  end
  attribute :updated_at do |animal|
    animal.updated_at && animal.created_at.strftime('%m/%d/%Y')
  end
end
