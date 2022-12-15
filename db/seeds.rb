puts "🌱 Seeding data..."

# Hotel data

hotel = Hotel.create(
    name: Moore Hotel
    location: Seattle, WA
)

hotel = Hotel.create(
    name: Thompson Seattle
    location: Seattle, WA
)

hotel = Hotel.create(
    name: Four Seasons Hotel Seattle
    location: Seattle, WA
)

hotel = Hotel.create(
    name: Mayflower Park Hotel
    location: Seattle, WA
)

hotel = Hotel.create(
    name: Omni
    location: San Francisco, CA
)

hotel = Hotel.create(
    name: Hotel Nikko
    location: San Francisco, CA
)

hotel = Hotel.create(
    name: Carpenter Hotel
    location: Austin, TX
)

hotel = Hotel.create(
    name: W Austin
    location: Austin, TX
)

hotel = Hotel.create(
    name: Courtyard by Marriott
    location: Los Angeles, CA
)

hotel = Hotel.create(
    name: New Sanno Hotel
    location: Tokyo, Japan
)

# User data

user = User.create(
    name: Henry Escobar
)

user = User.create(
    name: Will Perry
)

user = User.create(
    name: Matt Garling
)

user = User.create(
    name: Graham Duda
)

# Trip Data

puts "✅ Done seeding!"
