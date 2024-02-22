User.create!(email: 'dev1@example.com', password: 'password', first_name: 'User', last_name: 'One')

statuses = ['draft', 'unlocked', 'locked']

6.times do
  Capsule.create!(name: "Capsule name", user: User.first, status: statuses.sample, encapsulation_date: Time.now.to_date, unlock_date: rand(2.years).seconds.from_now)
end

3.times do
  Capsule.create!(name: "Capsule name", user: User.last, status: statuses.sample, encapsulation_date: Time.now.to_date, unlock_date: rand(1.year.ago..Time.now))
end
