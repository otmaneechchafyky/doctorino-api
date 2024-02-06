class VetSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :vet_photo, :available_from, :available_to, :fees, :bio
  attribute :created_at do |vet|
    vet.created_at && vet.created_at.strftime('%m/%d/%Y')
  end
  attribute :updated_at do |vet|
    vet.updated_at && vet.updated_at.strftime('%m/%d/%Y')
  end
end
