# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Dropping Database"

User.destroy_all
Medicine.destroy_all
Reminder.destroy_all

user_first_names = [
    "Victor", "Guilherme", "Atila", "William", "Rafael", "Roberto", "Admar",
    "Fernando", "Mariana", "Matheus", "Beatriz", "Camila", "Gustavo", "Pedro",
    "João", "Kayo", "Marcelo", "Ed", "Gabriel", "Felipe", "Leonardo",
    "Lucas", "Yoda", "Anakim", "Rick", "Morty", "Han", "Luke",
    "Chewbacca", "BB-8", "Boba", "R2-D2", "Jango", "Finn", "Kylo",
    "Leia", "Jerry", "Frank", "Trevor", "Michael", "Lamar", "Tanisha",
    "Kennedy", "Abraham", "Kennedy", "Houston", "Spike", "Hank", "Marie",
    "Jesse", "Lucy", "Candance", "Ferb", "Kenny", "Eric", "Stan", "Buzz",
    "Hermione", "Harry", "Marvin", "Severus", "Arthur"
]

user_last_names = [
    "Skywalker", "Solo", "Fett", "Baba", "Nest", "Dameron", "Jinn",
    "Ackbar", "Ren", "Emperor", "The Hut", "Maul", "Kenobi", "Smith",
    "Sanchez", "Phillips", "Myers", "Ocean", "Lamar", "Spiegel", "Paul",
    "Roiland", "McCormick", "Broflovski", "Cartman", "Marsh", "Lightyear",
    "Chef", "Slave", "Granger", "Malfoy", "Snape", "Lee", "Wood",
    "Williams", "Davis", "Mei", "Garcia", "Nguyen", "Carter", "Dumbledore",
    "Snyde", "Snape", "Dent", "Perfect", "Beeblebrox", "Slartibartfast"
]

some_easy_passwords = "123123"

email_endings = %w[
                    @gmail.com @gmail.com.br @outlook.com @outlook.com.br @yahoo.com @yahoo.com.br 
                    @hotmail.com @lewagon.com @lewagon.com.br @zoho.com @zoho.com.br @mail.com @mail.com.br
                  ]


# Setting emails trying to generate maximum uniques emails
user_emails = []
puts "Setting user emails"
100.times do 
    user_emails << "#{Faker::Ancient.god}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Ancient.primordial}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Ancient.titan}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Ancient.hero}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Artist.name}_#{Faker::Superhero.prefix}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Space.constellation}_#{Faker::Ancient.hero}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::CryptoCoin.coin_name}_#{Faker::Ancient.hero}#{email_endings.sample}".gsub(" ", "")
end

user_emails.map!(&:downcase).uniq!

# Creating users from seed
puts "Creating Users"
30.times do 
    user_email = user_emails.sample
    user_email = user_emails.sample until (User.pluck(:email).exclude?(user_email))

    user = User.create!(
        email: user_email,
        password: some_easy_passwords,
        first_name: user_first_names.sample,
        last_name: user_last_names.sample,
        username: "#{user_first_names.sample}_#{user_last_names.sample}".downcase
    )

    puts "\n#{user.id} - User Created - #{user.username}"
    puts "_" * 55
end

puts "Creating Medicines"
