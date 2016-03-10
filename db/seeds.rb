require 'faker'

10.times do
  Contact.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end