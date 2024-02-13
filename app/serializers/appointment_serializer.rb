class AppointmentSerializer
  include JSONAPI::Serializer
  attributes :id, :date, :time, :location, :duration, :animal_id, :vet_id
  attribute :created_at do |appointment|
    appointment.created_at && appointment.created_at.strftime('%m/%d/%Y')
  end
  attribute :updated_at do |appointment|
    appointment.updated_at && appointment.created_at.strftime('%m/%d/%Y')
  end
end
