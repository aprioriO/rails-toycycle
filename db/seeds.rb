# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
Trade.destroy_all
Toy.destroy_all
User.destroy_all


users = [
  { username: "Kitt", email: "kitt@example.com", password: "123456", description: "A creative individual and mom of two young kids who loves giving old toys a second life. She prefers trading with others who appreciate a good deal and is always on the lookout for something fun to refresh her children's collection."},
  { username: "Josh", email: "josh@example.com", password: "123456", description: "A social person with a 5-year-old who loves meeting others through the app. They’ve been using the platform for months to trade items and make new connections, always seeking a fair exchange and keeping things fun for their little one." },
  { username: "David", email: "david@example.com", password: "123456", description: "A minimalist mom with two kids who believes in the power of bartering to declutter their space. She’s always ready for a trade and loves the idea of giving away something her children have outgrown while getting something new in return." },
  { username: "Eve", email: "eve@example.com", password: "123456", description: "A family-oriented parent with three kids who barters toys as a way to keep them entertained and their home organized. They value quality over quantity and appreciate when others maintain the same mindset in their trades." },
  { username: "Hollie", email: "hollie@example.com", password: "123456", description: "A practical, environmentally-conscious dad with a 7-year-old who enjoys finding new homes for gently used toys. He’s all about reducing waste and loves the idea of trading toys with other families who share the same goal." },
  { username: "Melany", email: "melany@example.com", password: "123456", description: "A non-smoker with two young kids and a playful dog. They love bartering toys to keep their children entertained while also giving their pet some new things to enjoy. They believe in reducing waste and love the thrill of a good trade." },
  { username: "Ben", email: "ben@example.com", password: "123456", description: "A smoker with a cat and a 3-year-old who enjoys swapping toys on the app. They find it fun to keep their child’s toy collection fresh while also finding new items for their feline friend to play with." },
  { username: "Deji", email: "deji@example.com", password: "123456", description: "A non-smoker with two kids and a rabbit. They use the app to exchange toys for their children and pet, aiming to keep their home clutter-free while finding new, engaging items. They love the sense of community bartering brings and enjoy connecting with like-minded families." }
]


image_urls = [
  "https://cdn.prod.website-files.com/6365d860c7b7a7191055eb8a/65a751741ddf78d3cc798f24_Lana%20Steiner-p-500.jpg",
  "https://cdn.prod.website-files.com/6365d860c7b7a7191055eb8a/65a74f49e4ae12986f0d9e75_Drew%20Cano-p-500.jpg",
  "https://cdn.prod.website-files.com/6365d860c7b7a7191055eb8a/65a7521ac969907eada03c07_Mikey%20Lawrence-p-500.jpg",
  "https://cdn.prod.website-files.com/6365d860c7b7a7191055eb8a/65a74dbf4f6d57df0bf51624_Ava%20Wright-p-500.jpg",
  "https://cdn.prod.website-files.com/6365d860c7b7a7191055eb8a/65a753049744df4a8765df41_Rene%20Wells-p-500.jpg",
  "https://cdn.prod.website-files.com/6365d860c7b7a7191055eb8a/65a75352b2b14dfe494ff03a_Rosalee%20Melvin-p-500.jpg",
  "https://cdn.prod.website-files.com/6365d860c7b7a7191055eb8a/65a751a0a4117992e1b980d8_Loki%20Bright-p-500.jpg",
  "https://cdn.prod.website-files.com/6365d860c7b7a7191055eb8a/65a74b9b6a26cde15a2703e3_Ammar%20Foley-p-500.jpg"
]

users.each_with_index do |user,index|
  new_user = User.new(user)
  file = URI.parse(image_urls[index]).open
  new_user.photo.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
  new_user.save!
end

puts "Images assigned to all users!"
puts "Seeded #{User.count} users"

toys = [
  { name: "Shape Sorter", user: User.all[0], category: "Educational Toys", description: "Helps improve fine motor skills.", condition: "New", location: "123 Baker Street, London, NW1 6XE, United Kingdom", need_in_return: "Miniature Dollhouse", status: "Available" },
  { name: "Stacking Blocks", user: User.all[1], category: "Educational Toys", description: "Colorful wooden blocks for stacking fun.", condition: "Used", location: "56 High Street, Camden, London, NW1 8DB, United Kingdom", need_in_return: "Friends TV Series", status: "Available" },
  { name: "Science Kit", user: User.all[2], category: "Educational Toys", description: "Explore simple science experiments.", condition: "Good", location: "45 Deansgate, Manchester, M3 2EN, United Kingdom", need_in_return: "Interactive Doll", status: "Available" },
  { name: "Magic Maths Game", user: User.all[3], category: "Educational Toys", description: "A spellbinding game that makes maths and sums magic.", condition: "Excellent", location: "12 Oxford Street, Manchester, M1 5AN, United Kingdom", need_in_return: "Superhero Action Figure", status: "Available" },
  { name: "Robotics Kit", user: User.all[4], category: "Educational Toys", description: "Build your first robot.", condition: "New", location: "23 High Street, Dartford, DA1 1BY, United Kingdom", need_in_return: "Baby Doll", status: "Available" },
  { name: "Clipology", user: User.all[5], category: "Educational Toys", description: "All the best clips rolled into fun.", condition: "New", location: "78 Greenhithe Road, Dartford, DA9 9HR, United Kingdom", need_in_return: "Stuffed Bear", status: "Available" },
  { name: "Push Car", user: User.all[6], category: "Outdoor & Sports Toys", description: "Perfect for toddlers to ride around.", condition: "Good", location: "34 Kings Road, Reading, RG1 8DN, United Kingdom", need_in_return: "Calligraphy Kit", status: "Available" },
  { name: "Soft Ball", user: User.all[7], category: "Outdoor & Sports Toys", description: "Soft and safe for toddlers.", condition: "Used", location: "105 Coley Ave, Coley park, Reading, RG16FL, United Kingdom", need_in_return: "Clay Sculpting Set", status: "Available" },
  { name: "Hula Hoop", user: User.all[0], category: "Outdoor & Sports Toys", description: "Fun outdoor activity.", condition: "Excellent", location: "123 Baker Street, London, NW1 6XE, United Kingdom", need_in_return: "Painting Set", status: "Available" },
  { name: "Jump Rope", user: User.all[1], category: "Outdoor & Sports Toys", description: "Great for fitness and play.", condition: "Good", location: "56 High Street, Camden, London, NW1 8DB, United Kingdom", need_in_return: "Playdough", status: "Available" },
  { name: "Skateboard", user: User.all[2], category: "Outdoor & Sports Toys", description: "For advanced outdoor fun.", condition: "New", location: "45 Deansgate, Manchester, M3 2EN, United Kingdom", need_in_return: "Coloring Book", status: "Available" },
  { name: "Soccer Set", user: User.all[3], category: "Outdoor & Sports Toys", description: "Includes ball and goal net.", condition: "Used", location: "12 Oxford Street, Manchester, M1 5AN, United Kingdom", need_in_return: "Miniature Dollhouse", status: "Available" },
  { name: "Coloring Book", user: User.all[4], category: "Creative & Art Toys", description: "Perfect for little artists.", condition: "New", location: "23 High Street, Dartford, DA1 1BY, United Kingdom", need_in_return: "Skateboard", status: "Available" },
  { name: "Playdough", user: User.all[5], category: "Creative & Art Toys", description: "Non-toxic and colorful.", condition: "Good", location: "78 Greenhithe Road, Dartford, DA9 9HR, United Kingdom", need_in_return: "Jump Rope", status: "Available" },
  { name: "Craft Kit", user: User.all[6], category: "Creative & Art Toys", description: "DIY crafting fun.", condition: "Good", location: "34 Kings Road, Reading, RG1 8DN, United Kingdom", need_in_return: "Hula Hoop", status: "Available" },
  { name: "Painting Set", user: User.all[7], category: "Creative & Art Toys", description: "Complete set for beginners.", condition: "Excellent", location: "56 Church Street, Reading, RG4 8AU, United Kingdom", need_in_return: "Soft Ball", status: "Available" },
  { name: "Clay Sculpting Set", user: User.all[0], category: "Creative & Art Toys", description: "Advanced sculpting tools.", condition: "New", location: "123 Baker Street, London, NW1 6XE, United Kingdom", need_in_return: "Push Car", status: "Available" },
  { name: "Calligraphy Kit", user: User.all[1], category: "Creative & Art Toys", description: "Learn artistic writing.", condition: "New", location: "56 High Street, Camden, London, NW1 8DB, United Kingdom", need_in_return: "Clipology", status: "Available" },
  { name: "Stuffed Bear", user: User.all[2], category: "Action Figures & Dolls", description: "Soft and cuddly bear.", condition: "New", location: "45 Deansgate, Manchester, M3 2EN, United Kingdom", need_in_return: "Robotics Kit", status: "Available" },
  { name: "Baby Doll", user: User.all[3], category: "Action Figures & Dolls", description: "Cute doll for toddlers.", condition: "Used", location: "12 Oxford Street, Manchester, M1 5AN, United Kingdom", need_in_return: "Magic Maths Game", status: "Available" },
  { name: "Superhero Action Figure", user: User.all[4], category: "Action Figures & Dolls", description: "Exciting and fun.", condition: "Good", location: "23 High Street, Dartford, DA1 1BY, United Kingdom", need_in_return: "Science Kit", status: "Available" },
  { name: "Interactive Doll", user: User.all[5], category: "Action Figures & Dolls", description: "Talks and sings.", condition: "Excellent", location: "78 Greenhithe Road, Dartford, DA9 9HR, United Kingdom", need_in_return: "Shape Sorter", status: "Available" },
  { name: "Friends TV Series", user: User.all[6], category: "Action Figures & Dolls", description: "For serious collectors.", condition: "New", location: "34 Kings Road, Reading, RG1 8DN, United Kingdom", need_in_return: "Stacking Blocks", status: "Available" },
  { name: "Miniature Dollhouse", user: User.all[7], category: "Action Figures & Dolls", description: "Rainbow High Townhouse- 3-Story Wood Dollhouse Playset.", condition: "Good", location: "56 Church Street, Reading, RG4 8AU, United Kingdom", need_in_return: "Magic Maths Game", status: "Available" }
]



toy_urls = [
  "https://m.media-amazon.com/images/I/61ZnUquTtKL.__AC_SY300_SX300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/81GPrqGHJFL._AC_SY879_.jpg",
  "https://m.media-amazon.com/images/I/915POA6sxYL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/815JpjZYm+L._AC_SY300_SX300_.jpg",
  "https://m.media-amazon.com/images/I/71uuJUB5l-L.__AC_SY300_SX300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/81HnIq+TwML._AC_SY300_SX300_.jpg",
  "https://m.media-amazon.com/images/I/71O5mdTHZRL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/81ZygYZqOKL._AC_SX679_.jpg",
  "https://m.media-amazon.com/images/I/6161AHbJuaL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/61F6elTYLVL.__AC_SY300_SX300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/71GtoQu0klL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/618WOuZ02sL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/51eF7ymjI-L._SX342_SY445_.jpg",
  "https://m.media-amazon.com/images/I/71kyTuFTgvL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/81-J1gTmZQL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/81aLocGAsCL.__AC_SY300_SX300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/714qFCBjOcL.__AC_SY300_SX300_QL70_ML2_.jpg",
  "https://www.zieler.co.uk/wp-content/uploads/2019/09/09299264.png",
  "https://m.media-amazon.com/images/I/81UhzwkL5YL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/71re94tv3LL._AC_SX522_.jpg",
  "https://m.media-amazon.com/images/I/51UGC2cmEgL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/71R4Lkp9FJL.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/91qHtMyjKRS.__AC_SX300_SY300_QL70_ML2_.jpg",
  "https://m.media-amazon.com/images/I/81XEJqlvCsL.__AC_SX300_SY300_QL70_ML2_.jpg"
]

toys.each_with_index do |toy, index|
  new_toy = Toy.new(toy)
  file = URI.parse(toy_urls[index % toy_urls.length]).open
  new_toy.photo.attach(io: file, filename: "toy_#{index + 1}.jpg", content_type: "image/jpg")
  new_toy.save!
  puts "#{Toy.count}"
end

# toys.each do |toy|
#   Toy.create!(toy)
# end

puts "Seeded #{Toy.count} toys"

# users.each_with_index do |user,index|
#   new_user = User.new(user)
#   file = URI.parse(image_urls[index]).open
#   new_user.photo.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
#   new_user.save!
# end

# User.all.each_with_index do |user, index|
#   image_url = image_urls[index % image_urls.length]
#   file = URI.parse(image_url).open
#   user.photo.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
# end

# file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg").open
# article = Article.new(title: "NES", body: "A great console")
# article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# article.save
