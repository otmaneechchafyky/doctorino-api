class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :userName, :email, :profile_image, :created_at
  attribute :created_date do |user|
    user.created_at && user.created_at.strftime('%m/%d/%Y')
  end
end
