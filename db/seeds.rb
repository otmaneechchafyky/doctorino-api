require 'open-uri'

# Helper methods to create records

Genre.destroy_all

def create_genre(name)
  Genre.create(name: name)
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
genre5 = create_genre('Amphibian')
genre6 = create_genre('Insect')
genre7 = create_genre('Arachnid')
genre8 = create_genre('Domestic Animal')
genre9 = create_genre('Marine Animal')

# Creating specializations
specialization1 = create_specialization('Cardiology')
specialization2 = create_specialization('Dermatology')

# Creating vets
vet1 = create_vet('Dr. Taylor', 'https://picsum.photos/200', Time.parse('09:00'), Time.parse('17:00'), 80.0, 'Experienced vet', specialization1)
vet2 = create_vet('Dr. Anderson', 'https://picsum.photos/200', Time.parse('10:00'), Time.parse('18:00'), 75.0, 'Passionate about animals', specialization2)

# Delete animals associated with each genre
Genre.all.each do |genre|
  genre.animals.destroy_all
end

# Destroy genres
Genre.destroy_all

puts 'Seeding completed!'
