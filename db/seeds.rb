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

third_capsule = Capsule.create(encapsulation_date: Date.new(2023, 11, 16), unlock_date: Date.new(2024, 3, 16), status: 'unlocked', name: 'End of the journey, bacth #1371', user: simon)
# Capsule de fin de Batch >> Ajouter du contenu pour la dempo

puts 'Seeding messages for demo capsule'
Message.create!(title: 'DEAR WAGON WORLD', content: 'Dear Wagoners, it has been 6 months of coding, of doubting and of dreaming. Sometimes even making nightmares. I can still see overwhelming figures and pieces of codes in my mind but fuuuuck how good it was to spend these moments with all of you! Some of us will become developers and some of us will become front designers or just be more interested in coding. But we all be more than just student coders: we are Wagoners. So to all the Wagoners here in the room, congrats for all the sweat or the wold sweat we got in that cold room in Villa Gaudelet and well done for that long run hard work altogether and the sharing of informations. All of these memories were, are and will be scealed and engraved in that capsule to remind us all of that. We are all Time Capsules traveling through space & time together in a universe full of energy! harvest that energy and keep going further and further! To all my wagoners mates, PEACE!', capsule: third_capsule)
Message.create!(title: 'How to thrive in a coding world', content: 'So, imagine this: six months, ten budding coders, and enough caffeine to keep a small country awake. Welcome to the rollercoaster ride that was our coding bootcamp! We were a motley crew of aspiring developers, armed with laptops and determination, ready to conquer the digital world one bug at a time. But amidst the chaos and coffee-induced jitters. Let me just say, Git never looked so adorable... But it was nott all code and caffeine. We bonded over late-night debugging sessions, shared triumphs, and epic fails. We became a family, united by our love for curly braces and semicolons... Just kidding. What will we do now of our Tuesday, Thursday & Saturday free times?!', capsule: third_capsule)

# Seed audios
# third_capsule.audios.attach(io: file, filename: "audio-time-capsule.m4a", content_type: "audio/x-m4a")


puts 'Seeding images for demo capsule'

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1710276649/development/img_0756_qmjmii.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-cofee-break", content_type: "image/jpg")

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1710276651/development/img_0757_bu9l6x.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-talk", content_type: "image/jpg")

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1710276656/development/img_0777_dnhgrt.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-kebab", content_type: "image/jpg")

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1710276658/development/img_4434_ysldwg.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-talk-2", content_type: "image/jpg")

file = URI.open("https://res.cloudinary.com/dee3oejjj/image/upload/v1710276670/development/img_4437_dgbjql.jpg")
third_capsule.photos.attach(io: file, filename:"batch-1371-talk-2", content_type: "image/jpg")

puts 'Seeding video for demo capsule'

file = URI.open("https://res.cloudinary.com/dee3oejjj/video/upload/v1710276548/development/IMG_0776_zszfge.mp4")
third_capsule.videos.attach(io: file, filename:"batch-1371", content_type: "video/quicktime")

# Seed user_capsule

puts 'Seeding capsules relations between users'

UserCapsule.create(capsule: second_capsule, user: aurel)

users = [aurel, guillaume, simon, jeremy]

users.each do |user|
  UserCapsule.create(capsule: third_capsule, user: user)
end
