User.create!(email: 'dev1@example.com', password: 'password', first_name: 'User', last_name: 'One')

statuses = ['draft', 'unlocked', 'locked']

6.times do
  Capsule.create!(name: "Capsule name", user: User.first, status: statuses.sample)
end
