require 'open-uri'

# Create user

puts 'Creating Aurélien\'s profile'

file = URI.open("https://ca.slack-edge.com/T02NE0241-U05TWLW6WNB-c9427c7a9cd1-512")
aurel = User.new(email: 'aurelienph31@gmail.com', password: 'devtest', first_name: 'Aurélien', last_name: 'Pirus' )
aurel.avatar.attach(io: file, filename: "ap_avatar.jpg", content_type: "image/jpg")
aurel.save

puts 'Creating Guillaume\'s profile'

file = URI.open("https://ca.slack-edge.com/T02NE0241-U05U9MWHJ5Q-f19bf32b0dae-192")
guillaume = User.new(email: 'charlier.guillaume@gmail.com', password: 'devtest', first_name: 'Guillaume', last_name: 'Charlier' )
guillaume.avatar.attach(io: file, filename: "gc_avatar.jpg", content_type: "image/jpg")
guillaume.save

puts 'Creating Simon\'s profile'

file = URI.open("https://ca.slack-edge.com/T02NE0241-U05TX6MP4K1-3e24440587b5-512")
simon = User.new(email: 'Yoshimune2017@gmail.com', password: 'devtest', first_name: 'Simon', last_name: 'Inazuma' )
simon.avatar.attach(io: file, filename: "si_avatar.jpg", content_type: "image/jpg")
simon.save

puts 'Creating Jeremy\'s profile'

file = URI.open("https://ca.slack-edge.com/T02NE0241-U05UHERGUBU-fdefecdcf508-512")
jeremy =  User.new(email: 'jeremds33@gmail.com', password: 'devtest', first_name: 'Jeremy', last_name: 'Da Silva' )
jeremy.avatar.attach(io: file, filename: "jds_avatar.jpg", content_type: "image/jpg")
jeremy.save

# Seed locked capsules

puts 'Seeding locked capsules'

first_capsule = Capsule.create(encapsulation_date: Date.new(2024, 1, 1), unlock_date: Date.new(2024, 3, 16), status: 'locked', name: 'New year memories', user: aurel)
second_capsule = Capsule.create(encapsulation_date: Date.new(2023, 9, 16), unlock_date: Date.new(2024, 5, 31), status: 'locked', name: 'Batch memories', user: guillaume)

# Seed unlocked capsules

puts 'Seeding demo unlocked capsule'

third_capsule = Capsule.create(encapsulation_date: Date.new(2023, 11, 16), unlock_date: Date.new(2024, 3, 15), status: 'unlocked', name: 'End of the journey, bacth #1371', user: simon)
# Capsule de fin de Batch >> Ajouter du contenu pour la dempo


# Seed user_capsule

puts 'Seeding capsules relations bewteen users'

UserCapsule.create(capsule: second_capsule, user: aurel)

users = [aurel, guillaume, simon, jeremy]

users.each do |user|
  UserCapsule.create(capsule: third_capsule, user: user)
end
