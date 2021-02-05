require 'faker'

puts 'Deleting all kebabs \o/ '
Kebab.destroy_all

puts 'Creating samples Kebabs'
puts '-------------'

5.times do
  Kebab.create(name: Faker::Restaurant.name, address: Faker::Address.full_address, description: Faker::Restaurant.description)
end

puts '-------------'
puts 'Seed done'
