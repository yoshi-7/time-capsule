User.create!(email: 'dev1@example.com', password: 'password', first_name: 'User', last_name: 'One')
User.create!(email: 'dev2@example.com', password: 'password', first_name: 'User', last_name: 'Tow')
User.create!(email: 'dev3@example.com', password: 'password', first_name: 'User', last_name: 'Three')
User.create!(email: 'dev4@example.com', password: 'password', first_name: 'User', last_name: 'Four')

User.each do |user|
  types = ['draft', 'unlocked', 'locked']

  types.each_with_index do |type, i|
    Capsule.create!(name: "Capsule #{i + 1}", user: user, status: type)
  end
end
