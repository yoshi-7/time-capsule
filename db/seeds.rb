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

team_capsule = Capsule.create(encapsulation_date: Date.new(2015, 12, 31), unlock_date: Date.new(2024, 3, 16), status: 'unlocked', name: 'To future me', user: simon)

puts 'Seeding messages for demo capsule'

Message.create!(title: 'To Future me',content: 'Hey fututre me. I hope you\'re living our dreams and laughing often. I hope you\'re either doing that or have already achieved it. Don\'t forget to visit those places we dreamt about. Make sure you\'re kind, help others, and stay true to yourself. Have you got that dog we always wanted? It\'s never too late! Take care of our loved ones and remember where you came from. This message is from the 12-year-old you who believed in you the most. Dream big! Young you', capsule: team_capsule)

# Seed audios
# third_capsule.audios.attach(io: file, filename: "audio-time-capsule.m4a", content_type: "audio/x-m4a")


puts 'Seeding images for demo capsule'

team_capsule.photos.attach(io: File.open('app/assets/images/public/cfe33dd597c732fd3aaa467032822ed5.jpg'), filename:"batch-1371-cofee-break", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/IMG_4527.jpg'), filename:"batch-1371-talk", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/IMG_5662.jpg'), filename:"batch-1371-kebab", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/tumblr_ldwgmyKpHy1qa4rak.jpg'), filename:"batch-1371-talk-2", content_type: "image/jpg")

team_capsule.photos.attach(io: File.open('app/assets/images/public/tumblr_lqp5z0nuMj1qbqe22o1_500.jpg'), filename:"batch-1371-talk-2", content_type: "image/jpg")

# Seed user_capsule

puts 'Seeding capsules for user'

users = [aurel, guillaume, simon, jeremy]

users.each do |user|
  Capsule.create(status: 'draft', user: user, name: 'For Lisa\'s birthday')
  Capsule.create(encapsulation_date: Date.new(2023, 8, 31), unlock_date: Date.new(2024, 6, 16), status: 'locked', name: 'Solotrip to the moon', user: user)
  UserCapsule.create(capsule: Capsule.create(encapsulation_date: Date.new(2020, 8, 31), unlock_date: Date.new(2025, 1, 1), status: 'locked', name: 'Holidays with friends', user: jeremy), user: user)
end
