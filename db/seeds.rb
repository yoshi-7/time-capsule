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

puts 'Seeding demo capsule'

third_capsule = Capsule.create(encapsulation_date: Date.new(2023, 11, 16), unlock_date: Date.new(2024, 3, 15), status: 'unlocked', name: 'End of the journey, bacth #1371', user: simon)
# Capsule de fin de Batch >> Ajouter du contenu pour la dempo

puts 'Seeding messages for demo capsule'
Message.create!(title: 'New message to display in the show', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', capsule: third_capsule)
Message.create!(title: 'Second message for the show', content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis', capsule: third_capsule)

puts 'Seeding images for demo capsule'

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1709980326/img_4434_jv9fuq.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-cofee-break", content_type: "image/jpg")

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1709980324/img_0777_wvs3yh.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-talk", content_type: "image/jpg")

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1709980323/img_4437_qvkgvj.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-kebab", content_type: "image/jpg")

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1709980323/img_0756_bh1phf.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-talk-2", content_type: "image/jpg")

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1709980322/img_0757_m6wait.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-talk-2", content_type: "image/jpg")

puts 'Seeding video for demo capsule'

file = URI.open("https://res.cloudinary.com/dee3oejjj/video/upload/v1709981790/IMG_0776_sxjqyu.mp4")
third_capsule.videos.attach(io: file, filename:"batch-1371", content_type: "video/mp4")

# Seed user_capsule

puts 'Seeding capsules relations between users'

UserCapsule.create(capsule: second_capsule, user: aurel)

users = [aurel, guillaume, simon, jeremy]

users.each do |user|
  UserCapsule.create(capsule: third_capsule, user: user)
end
