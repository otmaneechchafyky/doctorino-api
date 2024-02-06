require 'faker'

# Create Genres
10.times do
  Genre.create(name: Faker::Creature::Animal.name)
end

# Create Specializations
10.times do
  Specialization.create(name: Faker::Job.field)
end

# Create Vets
10.times do
  Vet.create(
    name: Faker::Name.name,
    vet_photo: Faker::LoremFlickr.image,
    available_from: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    available_to: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
    fees: Faker::Number.decimal(l_digits: 2),
    bio: Faker::Lorem.sentence,
    specialization: Specialization.all.sample
  )
end

# Create Animals
10.times do
  Animal.create(
    name: Faker::Creature::Animal.name,
    animal_photo: Faker::LoremFlickr.image,
    date_of_birth: Faker::Date.birthday,
    weight: Faker::Number.decimal(l_digits: 2),
    escape_attempts: Faker::Number.between(from: 0, to: 10),
    owner: User.all.sample,
    genre: Genre.all.sample
  )
end

# Create Appointments
10.times do
  Appointment.create(
    date: Faker::Date.forward(days: 30),
    time: Faker::Time.forward(days: 30),
    location: Faker::Address.full_address,
    duration: Faker::Number.decimal(l_digits: 2),
    animal: Animal.all.sample,
    vet: Vet.all.sample
  )
end
