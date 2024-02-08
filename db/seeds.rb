# db/seeds.rb

# Helper methods to create records

def create_genre(name)
  Genre.create(name: name)
end

def create_user(username, email, password)
  User.create(
    userName: username,
    email: email,
    password: password,
    jti: SecureRandom.uuid
  )
end

def create_animal(name, animal_photo, date_of_birth, weight, escape_attempts, owner, genre)
  Animal.create(
    name: name,
    animal_photo: animal_photo,
    date_of_birth: date_of_birth,
    weight: weight,
    escape_attempts: escape_attempts,
    owner: owner,
    genre: genre
  )
end

def create_specialization(name)
  Specialization.create(name: name)
end

def create_vet(name, vet_photo, available_from, available_to, fees, bio, specialization)
  Vet.create(
    name: name,
    vet_photo: vet_photo,
    available_from: available_from,
    available_to: available_to,
    fees: fees,
    bio: bio,
    specialization: specialization
  )
end

# Creating genres
genre1 = create_genre('Cats')
genre2 = create_genre('Fishes')
genre3 = create_genre('Dinasors')
genre4 = create_genre('Birds')

# Creating users
user1 = create_user('JohnDoe', 'john@example.com', 'password')
user2 = create_user('JaneSmith', 'jane@example.com', 'password')

# Creating animals
animal1 = create_animal('Lion', 'https://picsum.photos/200', Date.new(2020, 5, 10), 150.5, 0, user1, genre1)
animal2 = create_animal('Duphin', 'https://picsum.photos/200', Date.new(2021, 8, 20), 5.2, 2, user2, genre2)

# Creating specializations
specialization1 = create_specialization('Cardiology')
specialization2 = create_specialization('Dermatology')

# Creating vets
vet1 = create_vet('Dr. Smith', 'https://picsum.photos/200', Time.parse('09:00'), Time.parse('17:00'), 80.0, 'Experienced vet', specialization1)
vet2 = create_vet('Dr. Johnson', 'https://picsum.photos/200', Time.parse('10:00'), Time.parse('18:00'), 75.0, 'Passionate about animals', specialization2)

puts 'Seeding completed!'
