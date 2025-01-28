# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Toy.destroy_all

users = [
  { username: "jdoe1", email: "jdoe1@example.com", password: "123456", description: "A creative individual and mom of two young kids who loves giving old toys a second life. She prefers trading with others who appreciate a good deal and is always on the lookout for something fun to refresh her children's collection."},
  { username: "asmith2", email: "asmith2@example.com", password: "123456", description: "A social person with a 5-year-old who loves meeting others through the app. They’ve been using the platform for months to trade items and make new connections, always seeking a fair exchange and keeping things fun for their little one." },
  { username: "bwilliams3", email: "bwilliams3@example.com", password: "123456", description: "A minimalist mom with two kids who believes in the power of bartering to declutter their space. She’s always ready for a trade and loves the idea of giving away something her children have outgrown while getting something new in return." },
  { username: "cjohnson4", email: "cjohnson4@example.com", password: "123456", description: "A family-oriented parent with three kids who barters toys as a way to keep them entertained and their home organized. They value quality over quantity and appreciate when others maintain the same mindset in their trades." },
  { username: "dthomas5", email: "dthomas5@example.com", password: "123456", description: "A practical, environmentally-conscious dad with a 7-year-old who enjoys finding new homes for gently used toys. He’s all about reducing waste and loves the idea of trading toys with other families who share the same goal." },
  { username: "emiller6", email: "emiller6@example.com", password: "123456", description: "A non-smoker with two young kids and a playful dog. They love bartering toys to keep their children entertained while also giving their pet some new things to enjoy. They believe in reducing waste and love the thrill of a good trade." },
  { username: "fwilson7", email: "fwilson7@example.com", password: "123456", description: "A smoker with a cat and a 3-year-old who enjoys swapping toys on the app. They find it fun to keep their child’s toy collection fresh while also finding new items for their feline friend to play with." },
  { username: "gmoore8", email: "gmoore8@example.com", password: "123456", description: "A non-smoker with two kids and a rabbit. They use the app to exchange toys for their children and pet, aiming to keep their home clutter-free while finding new, engaging items. They love the sense of community bartering brings and enjoy connecting with like-minded families." }
]
users.each do |user|
  User.create!(user)
end

puts "Seeded #{User.count} users"

toys = [
  { name: "Shape Sorter", user: User.all[0], category: "Educational Toys", description: "Helps improve fine motor skills.", condition: "New", location: "123 Baker Street, London, NW1 6XE, United Kingdom", need_in_return: "Miniature Dollhouse", status: "Available" },
  { name: "Stacking Blocks", user: User.all[1], category: "Educational Toys", description: "Colorful wooden blocks for stacking fun.", condition: "Used", location: "56 High Street, Camden, London, NW1 8DB, United Kingdom", need_in_return: "Friends TV Series", status: "Available" },
  { name: "Science Kit", user: User.all[2], category: "Educational Toys", description: "Explore simple science experiments.", condition: "Good", location: "45 Deansgate, Manchester, M3 2EN, United Kingdom", need_in_return: "Interactive Doll", status: "Available" },
  { name: "Magic Maths Game", user: User.all[3], category: "Educational Toys", description: "A spellbinding game that makes maths and sums magic.", condition: "Excellent", location: "12 Oxford Street, Manchester, M1 5AN, United Kingdom", need_in_return: "Superhero Action Figure", status: "Available" },
  { name: "Robotics Kit", user: User.all[4], category: "Educational Toys", description: "Build your first robot.", condition: "New", location: "23 High Street, Dartford, DA1 1BY, United Kingdom", need_in_return: "Baby Doll", status: "Available" },
  { name: "Clipology", user: User.all[5], category: "Educational Toys", description: "All the best clips rolled into fun.", condition: "New", location: "78 Greenhithe Road, Dartford, DA9 9HR, United Kingdom", need_in_return: "Stuffed Bear", status: "Available" },
  { name: "Push Car", user: User.all[6], category: "Outdoor & Sports Toys", description: "Perfect for toddlers to ride around.", condition: "Good", location: "34 Kings Road, Reading, RG1 8DN, United Kingdom", need_in_return: "Calligraphy Kit", status: "Available" },
  { name: "Soft Ball", user: User.all[7], category: "Outdoor & Sports Toys", description: "Soft and safe for toddlers.", condition: "Used", location: "Reading", need_in_return: "Clay Sculpting Set", status: "Available" },
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
toys.each do |toy|
  Toy.create!(toy)
end

puts "Seeded #{Toy.count} toys"
