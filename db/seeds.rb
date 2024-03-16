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

puts 'Seeding demo capsule'

team_capsule = Capsule.create(encapsulation_date: Date.new(2015, 12, 31), unlock_date: Date.new(2024, 3, 16), status: 'unlocked', name: '2015 memories', user: guillaume)
# Capsule de fin de Batch >> Ajouter du contenu pour la dempo

puts 'Seeding messages for demo capsule'

Message.create!(title: 'Dear friends',content: 'This 2015 year was amazing to us! Looking back at these photos brings back floods of memories. Remember that spontaneous road trip we took together? Driving through picturesque landscapes, singing along to our favorite tunes, and stopping at roadside diners for greasy burgers and milkshakes. Those were the days of carefree adventure and endless laughter. Looking back, I realize that 2015 wasn\'t just a year of unforgettable experiences; it was a year of growth, friendship, and discovering what truly brings joy to our lives. These photos capture just a glimpse of the magic that filled our days, and I\'m grateful for every single moment. Here\'s to cherishing the memories of 2015 and carrying their warmth with us into the future.', capsule: team_capsule)

# Seed audios
# third_capsule.audios.attach(io: file, filename: "audio-time-capsule.m4a", content_type: "audio/x-m4a")


puts 'Seeding images for demo capsule'

team_capsule.photos.attach(io: File.open('app/assets/images/public/020861-easy-rider.jpg'), filename:"batch-1371-cofee-break", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/DSC00284.jpg'), filename:"batch-1371-talk", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/esb03_700.jpg'), filename:"batch-1371-kebab", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/tumblr_l9xlrucuSR1qa4rak.gif'), filename:"batch-1371-talk-2", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/tumblr_l1718h0fz01qz7dr7o1_500.jpg'), filename:"batch-1371-talk-2", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/tumblr_lawwmzCgKn1qzyxjro1_400.jpg'), filename:"batch-1371-talk-2", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/tumblr_ldwgmyKpHy1qa4rak.jpg'), filename:"batch-1371-talk-2", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/tumblr_ldwor9Ua8o1qzc7p8o1_500.jpg'), filename:"batch-1371-talk-2", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/tumblr_lmcdu1X1vo1qzyxjr.jpg'), filename:"batch-1371-talk-2", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/tumblr_lqp5z0nuMj1qbqe22o1_500.jpg'), filename:"batch-1371-talk-2", content_type: "image/jpg")

# Seed user_capsule

puts 'Seeding capsules for user'

users = [aurel, guillaume, simon, jeremy]

users.each do |user|
  UserCapsule.create(capsule: team_capsule, user: user)
  Capsule.create(status: 'draft', user: user, name: 'For Lisa\'s birthday')
  Capsule.create(encapsulation_date: Date.new(2023, 8, 31), unlock_date: Date.new(2024, 6, 16), status: 'locked', name: 'Solotrip to the moon', user: user)
  UserCapsule.create(capsule: Capsule.create(encapsulation_date: Date.new(2020, 8, 31), unlock_date: Date.new(2025, 1, 1), status: 'locked', name: 'Holidays with friends', user: jeremy), user: user)
end
