require 'open-uri'

# Helper methods to create records

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
genre1 = create_genre('Cat')
genre2 = create_genre('Fishe')
genre3 = create_genre('Dog')
genre4 = create_genre('Bird')

# Creating users
user1 = create_user('AliceDoe', 'alice@example.com', 'password')
user2 = create_user('BobSmith', 'bob@example.com', 'password')

# Creating specializations
specialization1 = create_specialization('Cardiology')
specialization2 = create_specialization('Dermatology')

# Creating vets
vet1 = create_vet('Dr. Taylor', 'https://picsum.photos/200', Time.parse('09:00'), Time.parse('17:00'), 80.0, 'Experienced vet', specialization1)
vet2 = create_vet('Dr. Anderson', 'https://picsum.photos/200', Time.parse('10:00'), Time.parse('18:00'), 75.0, 'Passionate about animals', specialization2)

# Creating animals
animal1 = create_animal('Sam', 'https://picsum.photos/200', Date.new(2019, 7, 15), 180.2, 1, user1, genre1)
animal2 = create_animal('Olly', 'https://picsum.photos/200', Date.new(2022, 3, 8), 0.5, 0, user2, genre4)
animal3 = create_animal('Tig', 'https://picsum.photos/200', Date.new(20121, 3, 15), 178.2, 1, user1, genre1)
animal4 = create_animal('Parrot', 'https://picsum.photos/200', Date.new(2023, 3, 8), 0.5, 0, user2, genre4)
animal5 = create_animal('Nomad', 'https://picsum.photos/200', Date.new(2014, 7, 15), 70.2, 1, user1, genre1)
animal6 = create_animal('Onas', 'https://picsum.photos/200', Date.new(2010, 3, 8), 0.5, 0, user2, genre4)
animal7 = create_animal('Eric', 'https://picsum.photos/200', Date.new(2019, 7, 15), 19.2, 1, user1, genre1)
animal8 = create_animal('Max', 'https://picsum.photos/200', Date.new(2015, 3, 8), 0.5, 0, user2, genre4)
animal9 = create_animal('Minox', 'https://picsum.photos/200', Date.new(2016, 7, 15), 67.2, 1, user1, genre1)
animal10 = create_animal('Izabela', 'https://picsum.photos/200', Date.new(2017, 3, 8), 0.5, 0, user2, genre4)

puts 'Seeding completed!'
