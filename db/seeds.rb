require 'open-uri'

# Helper methods to create records

Genre.destroy_all

def create_genre(name)
  Genre.create(name: name)
end

def create_user(username, email, password)
  user = User.create(
    userName: username,
    email: email,
    password: password,
    jti: SecureRandom.uuid
  )
  puts "Created user: #{user.inspect}"
  user
end

def create_animal(name, animal_photo, date_of_birth, weight, escape_attempts, owner, genre)
  Animal.create(
    name: name,
    animal_photo: animal_photo,
    date_of_birth: date_of_birth,
    weight: weight,
    escape_attempts: escape_attempts,
    owner_id: owner.id,
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
genre1 = create_genre('Mammal')
genre2 = create_genre('Fish')
genre3 = create_genre('Bird')
genre4 = create_genre('Reptile')
genre1 = create_genre('Amphibian')
genre2 = create_genre('Insect')
genre3 = create_genre('Arachnid')
genre4 = create_genre('Domestic Animal')
genre1 = create_genre('Marine Animal')

# Creating users
user1 = create_user('AliceDoe', 'alice@example.com', 'password')
user2 = create_user('BobSmith', 'bob@example.com', 'password')

# Creating specializations
specialization1 = create_specialization('Cardiology')
specialization2 = create_specialization('Dermatology')

# Creating vets
vet1 = create_vet('Dr. Taylor', 'https://picsum.photos/200', Time.parse('09:00'), Time.parse('17:00'), 80.0, 'Experienced vet', specialization1)
vet2 = create_vet('Dr. Anderson', 'https://picsum.photos/200', Time.parse('10:00'), Time.parse('18:00'), 75.0, 'Passionate about animals', specialization2)

puts 'Seeding completed!'
