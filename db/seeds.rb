# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Question.destroy_all()
Answer.destroy_all()
User.destroy_all()

200.times do 
  q = Question.create(
      created_at: Faker::Date.backward(days: 365),
      updated_at: Faker::Date.backward(days: 365),
      title: Faker::Hacker.say_something_smart,
      body: Faker::ChuckNorris.fact,
      view_count: rand(10_000)
  )

  if q.valid?
    rand(1...5).times do
    Answer.create(body: Faker::Hacker.say_something_smart, question: q)
    end
  end
  
end

super_user = User.create(first_name:"Tony", last_name:"Stark",email:"tony@stark.com", password:"123abc",password_confirmation:"123abc")

puts "Generated super user"