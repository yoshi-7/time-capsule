User.create!(email: 'dev1@example.com', password: 'password', first_name: 'User', last_name: 'One')
User.create!(email: 'dev2@example.com', password: 'password', first_name: 'User', last_name: 'Tow')
User.create!(email: 'dev3@example.com', password: 'password', first_name: 'User', last_name: 'Three')
User.create!(email: 'dev4@example.com', password: 'password', first_name: 'User', last_name: 'Four')

statuses = ['draft', 'unlocked', 'locked']
6.times do
  Capsule.create!(name: "Capsule name", user: User.first, status: statuses.sample)
end
